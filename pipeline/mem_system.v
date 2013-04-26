/* $Author: karu $ */
/* $LastChangedDate: 2009-04-24 09:28:13 -0500 (Fri, 24 Apr 2009) $ */
/* $Rev: 77 $ */

module mem_system(/*AUTOARG*/
   // Outputs
   DataOut, Done, Stall, CacheHit, err, 
   // Inputs
   Addr, DataIn, Rd, Wr, createdump, clk, rst
   );
   
   input [15:0] Addr;
   input [15:0] DataIn;
   input        Rd;
   input        Wr;
   input        createdump;
   input        clk;
   input        rst;
   
   output [15:0] DataOut;
   output Done;
   output Stall;
   output CacheHit;
   output err;

   /* data_mem = 1, inst_mem = 0 *
    * needed for cache parameter */
   parameter mem_type = 0;

   localparam IDLE =          5'b00000;  // idle state signaling done
   localparam WR_CMPCACHE =   5'b00001;   // comparing data in cache on a wr request
   localparam WR_WRDIRTY0 =   5'b00010;    // data in cache was dirty, write it to memory
   localparam WR_WRDIRTY1 =   5'b00011;    // data in cache was dirty, write it to memory
   localparam WR_WRDIRTY2 =   5'b00100;    // data in cache was dirty, write it to memory
   localparam WR_WRDIRTY3 =   5'b00101;    // data in cache was dirty, write it to memory
   localparam WR_WRMEM =      5'b00110;
   localparam RDMEMWAIT =     5'b00111;
   localparam WR_WRCACHE0 =   5'b01000;    // write the data from input to the memory
   localparam WR_WRCACHE1 =   5'b01001;    // write the data from input to the memory
   localparam WR_WRCACHE2 =   5'b01010;    // write the data from input to the memory
   localparam WR_WRCACHE3 =   5'b01011;    // write the data from input to the memory
   localparam WR_WRCACHE3WR = 5'b01100; 
   localparam RD_CMPCACHE =   5'b01101;   // comparing data in cache on a rd request
   localparam RD_WRDIRTY0 =   5'b01110;    // no cache hit and data in slot is valid and dirty, write it to memory
   localparam RD_WRDIRTY1 =   5'b01111;    // no cache hit and data in slot is valid and dirty, write it to memory
   localparam RD_WRDIRTY2 =   5'b10000;    // no cache hit and data in slot is valid and dirty, write it to memory
   localparam RD_WRDIRTY3 =   5'b10001;    // no cache hit and data in slot is valid and dirty, write it to memory
   localparam RD_RDMEM0 =     5'b10010;      // read input addr from memory
   localparam RD_RDMEM1 =     5'b10011;      // read input addr from memory
   localparam RD_RDMEM2 =     5'b10100;      // read input addr from memory
   localparam RD_RDMEM3 =     5'b10101;      // read input addr from memory
   localparam RD_RDMEM3WR =   5'b10110; 
   localparam RD_RDMEMDONE =  5'b10111;

   // cache wires
   wire cDirty, cValid, cHit, cErr;
   wire cDirty2, cValid2, cHit2, cErr2;
   wire [4:0] cTag_out, cTag_out2;
   wire [15:0] cDataOut, cDataOut2;
   reg [15:0] cDataIn;
   reg [2:0] cOffset;
   reg cValidIn, cEnable, cEnable2, cComp, cWrite;

   // four_bank_mem wires
   wire mStall, mErr;
   reg mWr, mRd; 
   wire [15:0] mDataOut;
   reg [15:0] mAddr;
   wire [3:0] mBusy;

   // fsm wires
   reg [4:0] nxState;
   wire [4:0] state;
   wire [2:0] wait1, waitIn;
   reg nxStall, nxStall_IDLE, startWait;
   reg nxDone, nxDone_WR_CMPCACHE;
   wire Doneff, Stallff, holdMemff, nxCacheHit;
   wire victimValid, victimDirty, victimway, victimIn, victimSave, victimSaveIn;
   reg flipVictim, setVictim, victimSelect;
   reg nxholdMem, cHoldSelect;
   reg [4:0] requestType, nxSt_WR_CMPCACHE, nxSt_RD_CMPCACHE; // determines the next state 
   wire [4:0] nxSt_WR_WRDIRTY0, nxSt_WR_WRDIRTY1, nxSt_WR_WRDIRTY2, nxSt_WR_WRDIRTY3;
   wire [4:0] nxSt_WR_WRCACHE0, nxSt_WR_WRCACHE1, nxSt_WR_WRCACHE2, nxSt_WR_WRCACHE3;
   wire [4:0] nxSt_RD_WRDIRTY0, nxSt_RD_WRDIRTY1, nxSt_RD_WRDIRTY2, nxSt_RD_WRDIRTY3;
   wire [4:0] nxSt_RD_RDMEM0, nxSt_RD_RDMEM1, nxSt_RD_RDMEM2, nxSt_RD_RDMEM3;
   wire [4:0] waitStOut, nxSt_WR_WRMEM;
   reg [4:0] waitStNxt;
   reg [15:0] mDataIn;
   wire [15:0] mDataOutHold, cDataOutHold, cSelectOut;

   reg5bit streg(.clk(clk), .rst(rst), .en(1'b1), .in(nxState), .out(state));
   dff ff1(.q(Stallff), .d(nxStall), .clk(clk), .rst(rst));
   dff ff2(.q(Doneff), .d(nxDone), .clk(clk), .rst(rst));

   assign Done = Doneff;
   assign Stall = Stallff;
   
   // You must pass the mem_type parameter 
   // and createdump inputs to the 
   // cache modules

   assign err = mErr | cErr | cErr2;

   assign nxCacheHit = (cValid & cHit) | (cValid2 & cHit2);
   dff ff5(.q(CacheHit), .d(nxCacheHit), .clk(clk), .rst(rst));

   dff ff6(.q(victimway), .d(victimIn), .clk(clk), .rst(rst));
   assign victimIn = (flipVictim) ? ~victimway : victimway;


   dff ff7(.q(victimSave), .d(victimSaveIn), .clk(clk), .rst(rst));
   assign victimSaveIn = (setVictim) ? victimSelect : victimSave;

   always @(*) begin
        casex ({cValid, cValid2})
            2'b00: victimSelect = 1'b0;
            2'b01: victimSelect = 1'b0;
            2'b10: victimSelect = 1'b1;
            2'b11: victimSelect = victimway;
        endcase
   end

   assign victimValid = (victimSelect) ? cValid2 : cValid;
   assign victimDirty = (victimSelect) ? cDirty2 : cDirty;

   cache #(0 + mem_type) cache0(.enable(cEnable), .clk(clk), .rst(rst), .createdump(createdump), 
                    .tag_in(Addr[15:11]), .index(Addr[10:3]), .offset(cOffset), .data_in(cDataIn),
                    .comp(cComp), .write(cWrite), .valid_in(cValidIn), .tag_out(cTag_out), .data_out(cDataOut),
                    .hit(cHit), .dirty(cDirty), .valid(cValid), .err(cErr));

   cache #(2 + mem_type) cache1(.enable(cEnable2), .clk(clk), .rst(rst), .createdump(createdump), 
                    .tag_in(Addr[15:11]), .index(Addr[10:3]), .offset(cOffset), .data_in(cDataIn),
                    .comp(cComp), .write(cWrite), .valid_in(cValidIn), .tag_out(cTag_out2), .data_out(cDataOut2),
                    .hit(cHit2), .dirty(cDirty2), .valid(cValid2), .err(cErr2));

   four_bank_mem fmem(.clk(clk), .rst(rst), .createdump(createdump), .addr(mAddr), .data_in(mDataIn), .wr(mWr), .rd(mRd),
                    .data_out(mDataOut), .stall(mStall), .busy(mBusy), .err(mErr));

   reg16bit reg16_0(.clk(clk), .rst(rst), .en(1'b1), .in(mDataOut), .out(mDataOutHold));
   assign cSelectOut = (cHoldSelect) ? ((cValid & cHit) ? cDataOut : cDataOut2) : ((victimSave) ? cDataOut2 : cDataOut);
   reg16bit reg16_1(.clk(clk), .rst(rst), .en(1'b1), .in(cSelectOut), .out(cDataOutHold));

   // determines the next state from IDLE and sets up the values for the cache
   always @(*) begin
      casex ({Rd, Wr})
         2'b00: begin
            requestType = IDLE;
            nxStall_IDLE = 1'b0;
         end
         2'b01: begin
            requestType = WR_CMPCACHE;
            nxStall_IDLE = 1'b1;
         end
         2'b10: begin
            requestType = RD_CMPCACHE;
            nxStall_IDLE = 1'b1;
         end
         default: begin
            requestType = 5'bxxxxx;
            nxStall_IDLE = 1'bx;
         end
      endcase
   end

   // determines the next state from WR_CMPCACHE
   always @(*) begin
      nxDone_WR_CMPCACHE = 1'b0;
      
      casex({nxCacheHit,victimValid,victimDirty})
         3'b011: nxSt_WR_CMPCACHE = WR_WRDIRTY0;
         3'b010: nxSt_WR_CMPCACHE = WR_WRMEM;
         3'b1xx: begin
            nxSt_WR_CMPCACHE = IDLE;
            nxDone_WR_CMPCACHE = 1'b1;
         end
         3'b00x: nxSt_WR_CMPCACHE = WR_WRMEM;
         default: begin
            nxSt_WR_CMPCACHE = 5'bxxxxx;
            nxDone_WR_CMPCACHE = 1'bx;
         end
      endcase
   end

   // determins the next state from WR_WRDIRTY
   assign nxSt_WR_WRDIRTY0 = (mStall) ? WR_WRDIRTY0 : WR_WRDIRTY1;
   assign nxSt_WR_WRDIRTY1 = (mStall) ? WR_WRDIRTY1 : WR_WRDIRTY2;
   assign nxSt_WR_WRDIRTY2 = (mStall) ? WR_WRDIRTY2 : WR_WRDIRTY3;
   assign nxSt_WR_WRDIRTY3 = (mStall) ? WR_WRDIRTY3 : WR_WRMEM;

   // determins the next state from RD_CMPCACHE
   always @(*) begin
      casex({nxCacheHit,victimValid,victimDirty})
         3'b1xx: nxSt_RD_CMPCACHE = IDLE;
         3'b011: nxSt_RD_CMPCACHE = RD_WRDIRTY0;
         3'b010: nxSt_RD_CMPCACHE = RD_RDMEM0;
         3'b00x: nxSt_RD_CMPCACHE = RD_RDMEM0;
         default: nxSt_RD_CMPCACHE = 5'bxxxxx;
      endcase
   end

   // determins the next state from RD_WRDIRTY
   assign nxSt_RD_WRDIRTY0 = (mStall) ? RD_WRDIRTY0 : RD_WRDIRTY1;
   assign nxSt_RD_WRDIRTY1 = (mStall) ? RD_WRDIRTY1 : RD_WRDIRTY2;
   assign nxSt_RD_WRDIRTY2 = (mStall) ? RD_WRDIRTY2 : RD_WRDIRTY3;
   assign nxSt_RD_WRDIRTY3 = (mStall) ? RD_WRDIRTY3 : RD_RDMEM0;

   // determins the next state from RD_RDMEM
   // TODO: do write of whole cache line from mem to cache
   assign nxSt_RD_RDMEM0 = (mStall | (|wait1)) ? RD_RDMEM0 : RDMEMWAIT;
   assign nxSt_RD_RDMEM1 = (mStall) ? RD_RDMEM1 : RDMEMWAIT;
   assign nxSt_RD_RDMEM2 = (mStall) ? RD_RDMEM2 : RDMEMWAIT;
   assign nxSt_RD_RDMEM3 = (mStall) ? RD_RDMEM3 : RDMEMWAIT;

   // determins the next state from WR_WRCACHE
   assign nxSt_WR_WRMEM = (mStall) ? WR_WRMEM : WR_WRCACHE0;

   // determins the next state from WR_WRCACHE
   // TODO: add a 1 wait state for reading like done with writing
   assign nxSt_WR_WRCACHE0 = (mStall | ((Addr[2:0] == 3'b000) & (|wait1))) ? WR_WRCACHE0 : RDMEMWAIT;
   assign nxSt_WR_WRCACHE1 = (mStall | ((Addr[2:0] == 3'b010) & (|wait1))) ? WR_WRCACHE1 : RDMEMWAIT;
   assign nxSt_WR_WRCACHE2 = (mStall | ((Addr[2:0] == 3'b100) & (|wait1))) ? WR_WRCACHE2 : RDMEMWAIT;
   assign nxSt_WR_WRCACHE3 = (mStall | ((Addr[2:0] == 3'b110) & (|wait1))) ? WR_WRCACHE3 : RDMEMWAIT;

   reg5bit reg5_0(.clk(clk), .rst(rst), .en(1'b1), .in(waitStNxt), .out(waitStOut));

   // write wait fsm (signal asserted for 4 cycles)
   reg3bit reg3_0(.clk(clk), .rst(rst), .en(1'b1), .in(waitIn), .out(wait1));
   assign waitIn = ({startWait, wait1[2:1]});

   dff ff4(.q(holdMemff), .d(nxholdMem), .clk(clk), .rst(rst));
   assign DataOut = (holdMemff) ? cDataOutHold : mDataOutHold;

//TODO: add new states
always @(*) begin
      nxDone = 1'b0;
      nxStall = 1'b0;
      cEnable = 1'b0;
      cEnable2 = 1'b0;
      cComp = 1'b0;
      cWrite = 1'b0;
      cDataIn = DataIn;
      cValidIn = 1'b0;
      cOffset = Addr[2:0];
      mWr = 1'b0;
      mRd = 1'b0;
      mAddr = {cTag_out,Addr[10:0]};
      mDataIn = cDataOut;
      startWait = 1'b0;
      nxholdMem = 1'b0;
      waitStNxt = IDLE;
      flipVictim = 1'b0;
      setVictim = 1'b0;
      cHoldSelect = 1'b0;

      casex (state)
         IDLE: begin
            nxStall = nxStall_IDLE;
            flipVictim = (requestType != IDLE) ? 1'b1 : 1'b0;
            nxState = requestType;
         end
         WR_CMPCACHE: begin
            cEnable = 1'b1;
            cEnable2 = 1'b1;
            cComp = 1'b1;
            cWrite = 1'b1;
            setVictim = 1'b1;
            nxDone = nxDone_WR_CMPCACHE;
            nxStall = ~nxDone_WR_CMPCACHE;
            nxState = nxSt_WR_CMPCACHE;
         end
         WR_WRDIRTY0: begin
            cEnable = (victimSave) ? 1'b0 : 1'b1;
            cEnable2 = (victimSave) ? 1'b1 : 1'b0;
            cOffset = 3'b000;
            mWr = 1'b1;
            mAddr = {cTag_out,Addr[10:3],3'b000};
            startWait = (nxSt_WR_WRDIRTY0 == WR_WRDIRTY1) ? 1'b1 : 1'b0;
            nxStall = 1'b1;
            nxState = nxSt_WR_WRDIRTY0;
         end
         WR_WRDIRTY1: begin
            cEnable = (victimSave) ? 1'b0 : 1'b1;
            cEnable2 = (victimSave) ? 1'b1 : 1'b0;
            cOffset = 3'b010;
            mWr = 1'b1;
            mAddr = {cTag_out,Addr[10:3],3'b010};
            startWait = (nxSt_WR_WRDIRTY1 == WR_WRDIRTY2) ? 1'b1 : 1'b0;
            nxStall = 1'b1;
            nxState = nxSt_WR_WRDIRTY1;
         end
         WR_WRDIRTY2: begin
            cEnable = (victimSave) ? 1'b0 : 1'b1;
            cEnable2 = (victimSave) ? 1'b1 : 1'b0;
            cOffset = 3'b100;
            mWr = 1'b1;
            mAddr = {cTag_out,Addr[10:3],3'b100};
            startWait = (nxSt_WR_WRDIRTY2 == WR_WRDIRTY3) ? 1'b1 : 1'b0;
            nxStall = 1'b1;
            nxState = nxSt_WR_WRDIRTY2;
         end
         WR_WRDIRTY3: begin
            cEnable = (victimSave) ? 1'b0 : 1'b1;
            cEnable2 = (victimSave) ? 1'b1 : 1'b0;
            cOffset = 3'b110;
            mWr = 1'b1;
            mAddr = {cTag_out,Addr[10:3],3'b110};
            startWait = (nxSt_WR_WRDIRTY3 == WR_WRCACHE0) ? 1'b1 : 1'b0;
            nxStall = 1'b1;
            nxState = nxSt_WR_WRDIRTY3;
         end
         WR_WRMEM: begin
            mWr = 1'b1;
            nxStall= 1'b1;
            startWait = (nxSt_WR_WRMEM == WR_WRCACHE0) ? 1'b1 : 1'b0;
            mAddr = Addr;
            mDataIn = DataIn;
            nxState = nxSt_WR_WRMEM;
         end
         RDMEMWAIT: begin
            nxStall = 1'b1;
            nxState = waitStOut;
         end
         WR_WRCACHE0: begin
            mRd = 1'b1;
            mAddr = {Addr[15:3], 3'b000};
            waitStNxt = WR_WRCACHE1;
            nxStall= 1'b1;
            nxState = nxSt_WR_WRCACHE0;
         end
         WR_WRCACHE1: begin
            cEnable = (victimSave) ? 1'b0 : ((waitStOut == IDLE) ? 1'b1 : 1'b0);
            cEnable2 = (victimSave) ? ((waitStOut == IDLE) ? 1'b1 : 1'b0) : 1'b0;
            cWrite = 1'b1;
            cDataIn = mDataOut;
            cOffset = 3'b000;
            mRd = 1'b1;
            mAddr = {Addr[15:3], 3'b010};
            waitStNxt = WR_WRCACHE2;
            nxStall = 1'b1;
            nxState = nxSt_WR_WRCACHE1;
         end
         WR_WRCACHE2: begin
            cEnable = (victimSave) ? 1'b0 : ((waitStOut == IDLE) ? 1'b1 : 1'b0);
            cEnable2 = (victimSave) ? ((waitStOut == IDLE) ? 1'b1 : 1'b0) : 1'b0;
            cWrite = 1'b1;
            cDataIn = mDataOut;
            cOffset = 3'b010;
            mRd = 1'b1;
            mAddr = {Addr[15:3], 3'b100};
            waitStNxt = WR_WRCACHE3;
            nxStall = 1'b1;
            nxState = nxSt_WR_WRCACHE2;
         end
         WR_WRCACHE3: begin
            cEnable = (victimSave) ? 1'b0 : ((waitStOut == IDLE) ? 1'b1 : 1'b0);
            cEnable2 = (victimSave) ? ((waitStOut == IDLE) ? 1'b1 : 1'b0) : 1'b0;
            cWrite = 1'b1;
            cDataIn = mDataOut;
            cOffset = 3'b100;
            mRd = 1'b1;
            mAddr = {Addr[15:3], 3'b110};
            waitStNxt = WR_WRCACHE3WR;
            nxStall = 1'b1;
            nxState = nxSt_WR_WRCACHE3;
         end
         WR_WRCACHE3WR: begin
            cEnable = (victimSave) ? 1'b0 : 1'b1;
            cEnable2 = (victimSave) ? 1'b1 : 1'b0;
            cWrite = 1'b1;
            cDataIn = mDataOut;
            cOffset = 3'b110;
            cValidIn = 1'b1;
            nxStall = 1'b0;
            nxDone = 1'b1;
            nxState = IDLE;
         end
         RD_CMPCACHE: begin
            cEnable = 1'b1;
            cEnable2 = 1'b1;
            cComp = 1'b1;
            setVictim = 1'b1;
            nxDone = (nxSt_RD_CMPCACHE == IDLE) ? 1'b1 : 1'b0;
            nxStall = (nxSt_RD_CMPCACHE == IDLE) ? 1'b0 : 1'b1;
            nxState = nxSt_RD_CMPCACHE;
            nxholdMem = 1'b1;
            cHoldSelect = 1'b1;
         end
         RD_WRDIRTY0: begin
            cEnable = (victimSave) ? 1'b0 : 1'b1;
            cEnable2 = (victimSave) ? 1'b1 : 1'b0;
            cOffset = 3'b000;
            mWr = 1'b1;
            mAddr = {cTag_out,Addr[10:3],3'b000};
            startWait = (nxSt_RD_WRDIRTY0 == RD_WRDIRTY1) ? 1'b1 : 1'b0;
            nxStall = 1'b1;
            nxState = nxSt_RD_WRDIRTY0;
         end
         RD_WRDIRTY1: begin
            cEnable = (victimSave) ? 1'b0 : 1'b1;
            cEnable2 = (victimSave) ? 1'b1 : 1'b0;
            cOffset = 3'b010;
            mWr = 1'b1;
            mAddr = {cTag_out,Addr[10:3],3'b010};
            startWait = (nxSt_RD_WRDIRTY1 == RD_WRDIRTY2) ? 1'b1 : 1'b0;
            nxStall = 1'b1;
            nxState = nxSt_RD_WRDIRTY1;
         end
         RD_WRDIRTY2: begin
            cEnable = (victimSave) ? 1'b0 : 1'b1;
            cEnable2 = (victimSave) ? 1'b1 : 1'b0;
            cOffset = 3'b100;
            mWr = 1'b1;
            mAddr = {cTag_out,Addr[10:3],3'b100};
            startWait = (nxSt_RD_WRDIRTY2 == RD_WRDIRTY3) ? 1'b1 : 1'b0;
            nxStall = 1'b1;
            nxState = nxSt_RD_WRDIRTY2;
         end
         RD_WRDIRTY3: begin
            cEnable = (victimSave) ? 1'b0 : 1'b1;
            cEnable2 = (victimSave) ? 1'b1 : 1'b0;
            cOffset = 3'b110;
            mWr = 1'b1;
            mAddr = {cTag_out,Addr[10:3],3'b110};
            startWait = (nxSt_RD_WRDIRTY3 == RD_RDMEM0) ? 1'b1 : 1'b0;
            nxStall = 1'b1;
            nxState = nxSt_RD_WRDIRTY3;
         end
         RD_RDMEM0: begin
            mRd = 1'b1;
            mAddr = {Addr[15:3],3'b000};
            waitStNxt = RD_RDMEM1;
            nxStall = 1'b1;
            nxState = nxSt_RD_RDMEM0;
         end
         RD_RDMEM1: begin
            cEnable = (victimSave) ? 1'b0 : 1'b1;
            cEnable2 = (victimSave) ? 1'b1 : 1'b0;
            cWrite = 1'b1;
            cOffset = 3'b000;
            cDataIn = mDataOut;
            mRd = 1'b1;
            mAddr = {Addr[15:3],3'b010};
            waitStNxt = RD_RDMEM2;
            nxStall = 1'b1;
            nxState = nxSt_RD_RDMEM1;
         end
         RD_RDMEM2: begin
            cEnable = (victimSave) ? 1'b0 : 1'b1;
            cEnable2 = (victimSave) ? 1'b1 : 1'b0;
            cWrite = 1'b1;
            cOffset = 3'b010;
            cDataIn = mDataOut;
            mRd = 1'b1;
            mAddr = {Addr[15:3],3'b100};
            waitStNxt = RD_RDMEM3;
            nxStall = 1'b1;
            nxState = nxSt_RD_RDMEM2;
         end
         RD_RDMEM3: begin
            cEnable = (victimSave) ? 1'b0 : 1'b1;
            cEnable2 = (victimSave) ? 1'b1 : 1'b0;
            cWrite = 1'b1;
            cOffset = 3'b100;
            cDataIn = mDataOut;
            mRd = 1'b1;
            mAddr = {Addr[15:3],3'b110};
            waitStNxt = RD_RDMEM3WR;
            nxStall = 1'b1;
            nxState = nxSt_RD_RDMEM3;
         end
         RD_RDMEM3WR: begin
            cEnable = (victimSave) ? 1'b0 : 1'b1;
            cEnable2 = (victimSave) ? 1'b1 : 1'b0;
            cWrite = 1'b1;
            cOffset = 3'b110;
            cDataIn = mDataOut;
            nxStall = 1'b1;
            nxState = RD_RDMEMDONE;
         end
         RD_RDMEMDONE: begin
            cEnable = (victimSave) ? 1'b0 : 1'b1;
            cEnable2 = (victimSave) ? 1'b1 : 1'b0;
            nxholdMem = 1'b1;
            cHoldSelect = 1'b0;
            nxStall = 1'b0;
            nxDone = 1'b1;
            nxState = IDLE;
         end
         default: begin
            nxState = 4'bxxxx;
         end
      endcase
   end

endmodule // mem_system

   


// DUMMY LINE FOR REV CONTROL :9:
