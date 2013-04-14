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

   // single cycle wires
	wire [15:0] Instr,WrD,Rd1,Rd2,PCS,PC2,ALUoutput,RdD,Imm;
	wire [10:0] Instr_ex;
	wire [4:0] ALUOp;
	wire [2:0] flag;
	wire [1:0] ALUF;
	//control wires
	wire MemWrite,MemRead,zeroEx,dump,halt,MemtoReg,Jump,Branch,ALUSrc,RegWrite;
	wire [1:0] RegDst,size;
	//error wires
	wire err_fetch,err_decode,err_execute;

    // pipeline wires
    wire [15:0] instr_IFID, PC2_IFID, pcCurrent_IFID;
    wire [15:0] PC2_IDEX, Rd1_IDEX, Rd2_IDEX, Imm_IDEX;
    wire [4:0]  ALUOp_IDEX;
    wire [1:0] ALUF_IDEX, RegDst_IDEX;
    wire ALUSrc_IDEX, Branch_IDEX, Jump_IDEX, Dump_IDEX, MemtoReg_IDEX, MemWrite_IDEX, MemRead_IDEX;

    //assign err = err_fetch | err_decode | err_execute;
    assign err = 1'b0;

	//Fetch Stage
	fetch fetch0(.pcNext(PCS),.halt(halt),.Jump(Jump),.Branch(Branch),.Dump(dump),.PC2(PC2),.instr(Instr),
	    .err(err_fetch),.clk(clk),.rst(rst));

    // IFID pipeline reg
    regIFID ifid(.instr_In(Instr), .instr_IFID(instr_IFID), .PC2_In(PC2), .PC2_IFID(PC2_IFID), .pcCurrent_In(PCS), 
        .pcCurrent_IFID(pcCurrent_IFID), .halt(halt), .clk(clk), .rst(rst));

	//Control Module
	control ctrl(.Inst(instr_IFID),.size(size),.halt(halt),.zeroEx(zeroEx)
	   ,.RegDst(RegDst),.Jump(Jump)
		 ,.Branch(Branch),.MemRead(MemRead)
		,.MemWrite(MemWrite),.ALUOp(ALUOp),.ALUF(ALUF)
		,.MemtoReg(MemtoReg),.ALUSrc(ALUSrc)
		,.RegWrite(RegWrite),.Dump(dump),.rst(rst));

	//Decode Stage
	decode decode0(.Instr(instr_IFID),.size(size),.zeroEx(zeroEx),.Imm(Imm),.writeData(WrD),.RegDst(RegDst),
	    .RegWrite(RegWrite),.Rd1(Rd1),.Rd2(Rd2),
	    .err(err_decode),.clk(clk),.rst(rst));

    // IDEX pipeline reg
    regIDEX idex(.PC2_In(PC2_IFID), .PC2_IDEX(PC2_IDEX), .Rd1_In(Rd1), .Rd1_IDEX(Rd1_IDEX), .Rd2_In(Rd2), .Rd2_IDEX(Rd2_IDEX),
        .Imm_In(Imm), .Imm_IDEX(Imm_IDEX), .ALUOp_In(ALUOp), .ALUOp_IDEX(ALUOp_IDEX), .ALUF_In(ALUF), .ALUF_IDEX(ALUF_IDEX),
        .ALUSrc_In(ALUSrc), .ALUSrc_IDEX(ALUSrc_IDEX), .Branch_In(Branch), .Branch_IDEX(Branch_IDEX), .Jump_In(Jump),
        .Jump_IDEX(Jump_IDEX), .Dump_In(dump), .Dump_IDEX(Dump_IDEX), .MemtoReg_In(MemtoReg), .MemtoReg_IDEX(MemtoReg_IDEX),
        .MemWrite_In(MemWrite), .MemWrite_IDEX(MemWrite_IDEX), .MemRead_In(MemRead), .MemRead_IDEX(MemRead_IDEX));

	//Execute Stage
	execute ex(.PC2(PC2_IDEX),.ALUSrc(ALUSrc_IDEX),.ALUOp(ALUOp_IDEX),.Rd1(Rd1_IDEX),.Rd2(Rd2_IDEX),.Imm(Imm_IDEX),.ALUF(ALUF_IDEX), .Jump(Jump_IDEX), .Branch(Branch_IDEX)
		,.PCS(pcCurrent_IFID),.flag(flag),.ALUO(ALUoutput),.err(err_execute));

    // EXMEM pipline reg


	//Mem Stage
	memory memory0(.aluResult(ALUoutput),.writeData(Rd2_IDEX),.RdD(RdD)
	,.memWrite(MemWrite_IDEX),.memRead(MemRead_IDEX),.dump(Dump_IDEX)
	,.clk(clk),.rst(rst));

	//Write Back Stage
	writeBack wb(.RdD(RdD),.WrD(WrD),.ALUO(ALUoutput),.MemtoReg(MemtoReg_IDEX));
   
endmodule // proc
// DUMMY LINE FOR REV CONTROL :0:
