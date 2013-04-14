//John Vennard and Nick Aburn
//Single Stage processor file
/* $Author: karu $ */
/* $LastChangedDate: 2009-03-04 23:09:45 -0600 (Wed, 04 Mar 2009) $ */
/* $Rev: 45 $ */
module proc (/*AUTOARG*/
   // Outputs
   err, 
   // Inputs
   clk, rst
   );

   input clk;
   input rst;

   output err;

   // None of the above lines can be modified

   // OR all the err ouputs for every sub-module and assign it as this
   // err output

   // As desribed in the homeworks, use the err signal to trap corner
   // cases that you think are illegal in your statemachines
   
   
   /* your code here */
	wire [15:0] instr_IFID,WrD,Rd1,Rd2,PCS,PC2_IFID,ALUoutput,RdD,Imm;
	wire [10:0] Instr_ex;
	wire [4:0] ALUOp;
	wire [2:0] flag;
	wire [1:0] ALUF;

	//control wires
	wire MemWrite,MemRead,zeroEx,dump,halt,MemtoReg,Jump,Branch,ALUSrc,RegWrite;
	wire [1:0] RegDst,size;

	//Decode Wires
    wire [15:0] PC2_IDEX,Rd1_IDEX,Rd2_IDEX,Imm_IDEX;
    wire [4:0] ALUOp_IDEX;
    wire [1:0] RegDst_IDEX,ALUF_IDEX;
    wire ALUSrc_IDEX,Branch_IDEX,Dump_IDEX,MemtoReg_IDEX,MemWrite_IDEX,MemRead_IDEX,
        RegWrite_IDEX;
    wire [2:0] Rd2Addr_IDEX,WrR_IDEX; //WrR is write reg addr

    //execute wires
    wire [15:0] PCS_EXMEM, Imm_EXMEM, ALUO_EXMEM,Rd2_EXMEM;
    wire [2:0] WrR_EXMEM;
    wire MemtoReg_EXMEM,MemWrite_EXMEM,MemRead_EXMEM;
    wire Dump_EXMEM;
    
    //memory wires
    wire [15:0] RdD_MEMWB;
    wire [2:0] WrR_MEMWB;
    wire MemtoReg_MEMWB;

    //writeback wires
    wire [15:0] ALUO_MEMWB;
    wire RegWrite_MEMWB;

    //hazard control wires
    wire stallCtrl;
    
	//error wires
	wire err_fetch,err_decode,err_execute;

    //assign err = err_fetch | err_decode | err_execute;
    assign err = 1'b0;

	//Fetch Stage 
	fetch fetch0(.PCS(PCS),.stallCtrl(stallCtrl),.takeBranch_EXMEM(takeBranch_EXMEM),.halt(halt),.Jump(Jump),.Dump(dump)
    ,.PC2_IFID(PC2_IFID),.instr_IFID(instr_IFID),.err(err_fetch),.clk(clk),.rst(rst));
    //Hazard control -- with fetch for pipeline
    hazardDetect hD(.MemRead_IDEX(MemRead_IDEX),.Rd2Addr_IDEX(Rd2Addr_IDEX),.Rd1Addr_IFID(instr_IFID[10:8])
                    ,.Rd2Addr_IFID(instr_IFID[7:5]),.stallCtrl(stallCtrl), .clk(clk), .rst(rst));

	//Decode Stage
	decode decode0(.instr_IFID(instr_IFID),.PC2_IFID(PC2_IFID),.size(size),.zeroEx(zeroEx)
    ,.WrR_MEMWB(WrR_MEMWB),.writeData(WrD),.RegDst(RegDst),.RegWrite(RegWrite), .RegWrite_MEMWB(RegWrite_MEMWB)
	,.err(err_decode),.clk(clk),.rst(rst),.ALUOp(ALUOp),.ALUF(ALUF),.ALUSrc(ALUSrc)
    ,.Branch(Branch),.Dump(dump),.MemtoReg(MemtoReg),.MemWrite(MemWrite)
    ,.MemRead(MemRead),.PC2_IDEX(PC2_IDEX),.Rd1_IDEX(Rd1_IDEX),.Rd2_IDEX(Rd2_IDEX)
    ,.Imm_IDEX(Imm_IDEX),.ALUOp_IDEX(ALUOp_IDEX),.RegDst_IDEX(RegDst_IDEX)
    ,.ALUF_IDEX(ALUF_IDEX),.ALUSrc_IDEX(ALUSrc_IDEX),.Branch_IDEX(Branch_IDEX),.takeBranch_EXMEM(takeBranch_EXMEM)
    ,.Dump_IDEX(Dump_IDEX),.MemtoReg_IDEX(MemtoReg_IDEX)
    ,.MemWrite_IDEX(MemWrite_IDEX),.MemRead_IDEX(MemRead_IDEX),.RegWrite_IDEX(RegWrite_IDEX)
    ,.Rd2Addr_IDEX(Rd2Addr_IDEX),.WrR_IDEX(WrR_IDEX),.stallCtrl(stallCtrl));

    //Control Module -- in same place as decode for purpose of pipeline
    control ctrl(.Inst(instr_IFID),.size(size),.halt(halt),.zeroEx(zeroEx)
        ,.RegDst(RegDst),.Jump(Jump)
        ,.Branch(Branch),.MemRead(MemRead)
        ,.MemWrite(MemWrite),.ALUOp(ALUOp),.ALUF(ALUF)
        ,.MemtoReg(MemtoReg),.ALUSrc(ALUSrc)
        ,.RegWrite(RegWrite),.Dump(dump),.rst(rst));


	//Execute Stage
	execute ex(.PC2_IDEX(PC2_IDEX),.Rd1_IDEX(Rd1_IDEX),.Rd2_IDEX(Rd2_IDEX)
    ,.Imm_IDEX(Imm_IDEX),.ALUOp_IDEX(ALUOp_IDEX)
    ,.ALUF_IDEX(ALUF_IDEX),.ALUSrc_IDEX(ALUSrc_IDEX),.Branch_IDEX(Branch_IDEX),.takeBranch_EXMEM(takeBranch_EXMEM)
    ,.Dump_IDEX(Dump_IDEX),.MemtoReg_IDEX(MemtoReg_IDEX)
    ,.MemRead_IDEX(MemRead_IDEX),.WrR_IDEX(WrR_IDEX),.WrR_EXMEM(WrR_EXMEM),.RegWrite_IDEX(RegWrite_IDEX), .RegWrite_EXMEM(RegWrite_EXMEM)
    ,.PCS_EXMEM(PCS_EXMEM),.Imm_EXMEM(Imm_EXMEM),.ALUO_EXMEM(ALUO_EXMEM)
    ,.Rd2_EXMEM(Rd2_EXMEM),.MemtoReg_EXMEM(MemtoReg_EXMEM), .MemWrite_IDEX(MemWrite_IDEX)
    ,.MemWrite_EXMEM(MemWrite_EXMEM),.MemRead_EXMEM(MemRead_EXMEM),.Dump_EXMEM(Dump_EXMEM)
    ,.clk(clk),.rst(rst),.err(err_execute));

	//Mem Stage
    //TODO CHANGED Mem_Access -> memory for testing
	memory memory0(.Imm_EXMEM(Imm_EXMEM),.ALUO_EXMEM(ALUO_EXMEM),.WrR_EXMEM(WrR_EXMEM),.WrR_MEMWB(WrR_MEMWB)
                    ,.Rd2_EXMEM(Rd2_EXMEM),.takeBranch_EXMEM(takeBranch_EXMEM), .RegWrite_EXMEM(RegWrite_EXMEM)
                    , .RegWrite_MEMWB(RegWrite_MEMWB), .MemtoReg_EXMEM(MemtoReg_EXMEM),.MemWrite_EXMEM(MemWrite_EXMEM)
                    ,.MemRead_EXMEM(MemRead_EXMEM),.Dump_EXMEM(Dump_EXMEM),.RdD_MEMWB(RdD_MEMWB)
                    ,.MemtoReg_MEMWB(MemtoReg_MEMWB)
	                ,.clk(clk),.rst(rst));

	//Write Back Stage
	writeBack wb(.RdD_MEMWB(RdD_MEMWB),.WrD(WrD),.ALUO_MEMWB(ALUO_MEMWB)
                ,.MemtoReg_MEMWB(MemtoReg_MEMWB));


   
endmodule // proc
// DUMMY LINE FOR REV CONTROL :0:

