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

   //fetch wires
	wire [15:0] instr_IFID,WrD,Rd1,Rd2,PC2_IFID,PC_IFID,ALUoutput,RdD,Imm;
	wire [10:0] Instr_ex;
	wire [4:0] ALUOp;
	wire [2:0] flag;
	wire [1:0] ALUF;
    wire halt_IFID,takeBranch;

	//control wires
	wire MemWrite,MemRead,zeroEx,dump,halt,MemtoReg,Jump,Branch,ALUSrc,RegWrite;
	wire [1:0] RegDst,size;

	//Decode Wires
    wire [15:0] PC2_IDEX,PC_IDEX,Rd1_IDEX,Rd2_IDEX,Imm_IDEX;
    wire [4:0] ALUOp_IDEX;
    wire [1:0] RegDst_IDEX,ALUF_IDEX;
    wire ALUSrc_IDEX,Branch_IDEX,Dump_IDEX,MemtoReg_IDEX,MemWrite_IDEX,MemRead_IDEX,
        RegWrite_IDEX,Jump_IDEX;
    wire [2:0] Rd2Addr_IDEX,WrR_IDEX; //WrR is write reg addr

    //execute wires
    wire [15:0] PCS_EXMEM, Imm_EXMEM, ALUO_EXMEM,Rd2_EXMEM;
    wire [2:0] WrR_EXMEM;
    wire MemtoReg_EXMEM,MemWrite_EXMEM,MemRead_EXMEM;
    wire Dump_EXMEM,halt_IDEX;
    
    //memory wires
    wire [15:0] RdD_MEMWB;
    wire [2:0] WrR_MEMWB;
    wire MemtoReg_MEMWB;

    //writeback wires
    wire [15:0] ALUO_MEMWB;
    wire RegWrite_MEMWB;

    //hazard control wires
    wire stallCtrl,startStall,mStallInstr,mStallData,freeze,loadDetect,loadDetect_IDEX,loadDetect_EXMEM;
    wire storeDetect,storeDetect_IDEX,storeDetect_EXMEM;
    
    //fowarding control wires
    wire [1:0] forwardA,forwardB;
    wire [2:0] Rd1Addr_IDEX;

	//error wires
	wire err_fetch,err_decode,err_execute;

    //assign err = err_fetch | err_decode | err_execute;
    assign err = err_fetch | err_decode;

	//Fetch Stage 
	fetch fetch0(.PCS(PCS_EXMEM),.stallCtrl(stallCtrl),.takeBranch(takeBranch),.takeBranch_EXMEM(takeBranch_EXMEM),.Dump(dump)
    ,.PC2_IFID(PC2_IFID),.PC_IFID(PC_IFID),.instr_IFID(instr_IFID),.halt_IFID(halt_IFID),.err(err_fetch),.loadDetect(loadDetect),.storeDetect(storeDetect)
    ,.clk(clk),.rst(rst),.PC_IDEX(PC_IDEX),.startStall(startStall),.mStallInstr(mStallInstr),.freeze(freeze),.mStallData(mStallData));

    //Hazard control -- with fetch for pipeline
    hazardDetect hD(.takeBranch_EXMEM(takeBranch_EXMEM),.RegWrite_IDEX(RegWrite_IDEX),.RegWrite_EXMEM(RegWrite_EXMEM),.WrR_IDEX(WrR_IDEX)
                    ,.WrR_EXMEM(WrR_EXMEM),.Rd1Addr_IFID(instr_IFID[10:8]),.Rd2Addr_IFID(instr_IFID[7:5])
                    ,.stallCtrl(stallCtrl), .clk(clk), .rst(rst),.loadDetect_IDEX(loadDetect_IDEX),.loadDetect_EXMEM(loadDetect_EXMEM)
                    ,.takeBranch(takeBranch),.WrR_MEMWB(WrR_MEMWB),.RegWrite_MEMWB(RegWrite_MEMWB),.loadDetect(loadDetect)
					,.MemRead_EXMEM(MemRead_EXMEM),.MemWrite_EXMEM(MemWrite_EXMEM)
                    ,.startStall(startStall),.freeze(freeze),.mStallData(mStallData),.mStallInstr(mStallInstr));

	//Decode Stage
	decode decode0(.instr_IFID(instr_IFID),.PC2_IFID(PC2_IFID),.size(size),.zeroEx(zeroEx)
    ,.WrR_MEMWB(WrR_MEMWB),.writeData(WrD),.RegDst(RegDst),.RegWrite(RegWrite), .RegWrite_MEMWB(RegWrite_MEMWB)
	,.err(err_decode),.clk(clk),.rst(rst),.ALUOp(ALUOp),.ALUF(ALUF),.ALUSrc(ALUSrc)
    ,.Branch(Branch),.Dump(dump),.MemtoReg(MemtoReg),.MemWrite(MemWrite)
    ,.MemRead(MemRead),.PC2_IDEX(PC2_IDEX),.Rd1_IDEX(Rd1_IDEX),.Rd2_IDEX(Rd2_IDEX)
    ,.Imm_IDEX(Imm_IDEX),.ALUOp_IDEX(ALUOp_IDEX),.RegDst_IDEX(RegDst_IDEX)
    ,.ALUF_IDEX(ALUF_IDEX),.ALUSrc_IDEX(ALUSrc_IDEX),.Branch_IDEX(Branch_IDEX),.takeBranch(takeBranch),.takeBranch_EXMEM(takeBranch_EXMEM)
    ,.Dump_IDEX(Dump_IDEX),.MemtoReg_IDEX(MemtoReg_IDEX),.PC_IFID(PC_IFID),.PC_IDEX(PC_IDEX)
    ,.MemWrite_IDEX(MemWrite_IDEX),.MemRead_IDEX(MemRead_IDEX),.RegWrite_IDEX(RegWrite_IDEX),.storeDetect(storeDetect),.storeDetect_IDEX(storeDetect_IDEX)
    ,.Rd2Addr_IDEX(Rd2Addr_IDEX),.WrR_IDEX(WrR_IDEX),.stallCtrl(stallCtrl),.halt_IFID(halt_IFID)
    ,.halt_IDEX(halt_IDEX),.Jump(Jump),.Jump_IDEX(Jump_IDEX),.loadDetect(loadDetect),.loadDetect_IDEX(loadDetect_IDEX)
    ,.MemtoReg_MEMWB(MemtoReg_MEMWB),.freeze(freeze),.Rd1Addr_IDEX(Rd1Addr_IDEX));

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
    ,.Dump_IDEX(Dump_IDEX),.MemtoReg_IDEX(MemtoReg_IDEX),.takeBranch(takeBranch)
    ,.MemRead_IDEX(MemRead_IDEX),.WrR_IDEX(WrR_IDEX),.WrR_EXMEM(WrR_EXMEM),.RegWrite_IDEX(RegWrite_IDEX), .RegWrite_EXMEM(RegWrite_EXMEM)
    ,.PCS_EXMEM(PCS_EXMEM),.ALUO_EXMEM(ALUO_EXMEM),.PC_IDEX(PC_IDEX),.freeze(freeze),.storeDetect_IDEX(storeDetect_IDEX),.storeDetect_EXMEM(storeDetect_EXMEM)
    ,.Rd2_EXMEM(Rd2_EXMEM),.MemtoReg_EXMEM(MemtoReg_EXMEM), .MemWrite_IDEX(MemWrite_IDEX)
    ,.MemWrite_EXMEM(MemWrite_EXMEM),.MemRead_EXMEM(MemRead_EXMEM),.Dump_EXMEM(Dump_EXMEM)
    ,.clk(clk),.rst(rst),.err(err_execute),.halt_IDEX(halt_IDEX),.halt_EXMEM(halt_EXMEM),.Jump_IDEX(Jump_IDEX)
    ,.WrD(WrD),.forwardA(forwardA),.forwardB(forwardB),.loadDetect_IDEX(loadDetect_IDEX),.loadDetect_EXMEM(loadDetect_EXMEM));

    //Forwarding Control Unit
    forwarding unit(.Rd1Addr_IDEX(Rd1Addr_IDEX),.Rd2Addr_IDEX(Rd2Addr_IDEX),.WrR_MEMWB(WrR_MEMWB),.WrR_EXMEM(WrR_EXMEM)
                    ,.forwardA(forwardA),.forwardB(forwardB),.RegWrite_EXMEM(RegWrite_EXMEM),.loadDetect_EXMEM(loadDetect_EXMEM)
                    ,.RegWrite_MEMWB(RegWrite_MEMWB),.takeBranch_EXMEM(takeBranch_EXMEM),.takeBranch(takeBranch)
                    ,.halt_IFID(halt_IFID),.halt_IDEX(halt_IDEX),.storeDetect_IDEX(storeDetect_IDEX));

	//Mem Stage
	memory memory0(.ALUO_EXMEM(ALUO_EXMEM),.ALUO_MEMWB(ALUO_MEMWB),.WrR_EXMEM(WrR_EXMEM),.WrR_MEMWB(WrR_MEMWB)
                    ,.Rd2_EXMEM(Rd2_EXMEM),.takeBranch(takeBranch),.takeBranch_EXMEM(takeBranch_EXMEM), .RegWrite_EXMEM(RegWrite_EXMEM)
                    , .RegWrite_MEMWB(RegWrite_MEMWB), .MemtoReg_EXMEM(MemtoReg_EXMEM),.MemWrite_EXMEM(MemWrite_EXMEM)
                    ,.MemRead_EXMEM(MemRead_EXMEM),.Dump_EXMEM(Dump_EXMEM),.RdD_MEMWB(RdD_MEMWB)
                    ,.MemtoReg_MEMWB(MemtoReg_MEMWB),.freeze(freeze),.mStallData(mStallData)
	                ,.clk(clk),.rst(rst),.halt_EXMEM(halt_EXMEM),.mStallInstr(mStallInstr));

	//Write Back Stage
	writeBack wb(.RdD_MEMWB(RdD_MEMWB),.WrD(WrD),.ALUO_MEMWB(ALUO_MEMWB)
                ,.MemtoReg_MEMWB(MemtoReg_MEMWB));


   
endmodule // proc
// DUMMY LINE FOR REV CONTROL :0:
