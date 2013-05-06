module hazardDetect(takeBranch,takeBranch_EXMEM,RegWrite_IDEX,RegWrite_EXMEM,WrR_IDEX,WrR_EXMEM,
            Rd1Addr_IFID,Rd2Addr_IFID,MemRead_EXMEM,MemWrite_EXMEM,
            stallCtrl,clk,rst,WrR_MEMWB,RegWrite_MEMWB,startStall,mStallInstr,mStallData,freeze);

    input [2:0] WrR_IDEX,WrR_EXMEM,WrR_MEMWB,Rd1Addr_IFID,Rd2Addr_IFID;
    input RegWrite_IDEX,RegWrite_EXMEM,mStallInstr,mStallData,MemRead_EXMEM,MemWrite_EXMEM;
    input clk,rst,takeBranch_EXMEM,takeBranch;
    output stallCtrl,RegWrite_MEMWB,startStall,freeze;
    wire stall2,stall3,a,b,c,d,e,f,checkSt3,checkSt3Out,checkSt2Out;
    reg stall1;

    //flag that allows stall to run twice
    dff_en ff(.clk(clk),.rst(rst),.en(1'b1),.in(stall3),.out(checkSt3));
    dff_en ff2(.clk(clk),.rst(rst),.en(1'b1),.in(checkSt3),.out(checkSt3Out));
    dff_en ff3(.clk(clk),.rst(rst),.en(1'b1),.in(stall2),.out(checkSt2Out));
    
    //stall logic
    assign a = WrR_IDEX == Rd1Addr_IFID;
    assign b = WrR_IDEX == Rd2Addr_IFID;
    assign c = WrR_EXMEM == Rd1Addr_IFID;
    assign d = WrR_EXMEM == Rd2Addr_IFID;
    assign e = WrR_MEMWB == Rd1Addr_IFID;
    assign f = WrR_MEMWB == Rd2Addr_IFID;

    assign stall3 = (takeBranch_EXMEM | takeBranch) ? 1'b0 :((RegWrite_IDEX) ? (a|b) : 1'b0);
    assign stall2 = (takeBranch_EXMEM | takeBranch) ? 1'b0 : ((RegWrite_EXMEM) ? (c|d) : 1'b0);

    always @(*) begin
        casex({(takeBranch_EXMEM | takeBranch),(MemRead_EXMEM | MemWrite_EXMEM), RegWrite_MEMWB})
            3'b1xx: stall1 = 1'b0;
            3'b01x: stall1 = 1'b1;
            3'b001: stall1 = (e|f);
            3'b000: stall1 = 1'b0;
            default: stall1 = 1'b0;
        endcase
    end
    
    assign startStall = (stall3 | (stall2 & (~checkSt3)) | (stall1 & ((~checkSt2Out)&(~checkSt3Out))));
    assign stallCtrl =  (stall3 | stall2 |  stall1);
   
    //freeze logic
    assign freeze = ~(mStallInstr | mStallData);
endmodule
