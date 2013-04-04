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

	//Fetch Stage
	fetch fetch0(.pcNext(PCS),.halt(halt),.Jump(Jump),.Branch(Branch),.Dump(dump),.PC2(PC2),.instr(Instr)
	,.err(err_fetch),.clk(clk),.rst(rst));

	//Decode Stage
	decode decode0(.Instr(Instr),.size(size),.zeroEx(zeroEx),.Imm(Imm),.writeData(WrD),.RegDst(RegDst)
	,.RegWrite(RegWrite),.Rd1(Rd1),.Rd2(Rd2)
	,.err(err_decode),.clk(clk),.rst(rst));

	//Execute Stage
	execute ex(.PC2(PC2),.ALUSrc(ALUSrc),.ALUOp(ALUOp),.Rd1(Rd1),.Rd2(Rd2),.Imm(Imm),.ALUF(ALUF), .Jump(Jump), .Branch(Branch)
		,.PCS(PCS),.flag(flag),.ALUO(ALUoutput),.err(err_execute));

	//Mem Stage
	Mem_Access memory0(.aluResult(ALUoutput),.writeData(Rd2),.RdD(RdD)
	,.memWrite(MemWrite),.memRead(MemRead),.dump(dump)
	,.clk(clk),.rst(rst));

	//Write Back Stage
	writeBack wb(.RdD(RdD),.WrD(WrD),.ALUO(ALUoutput),.MemtoReg(MemtoReg));

	//Control Module
	control ctrl(.Inst(Instr),.size(size),.halt(halt),.zeroEx(zeroEx)
	   ,.RegDst(RegDst),.Jump(Jump)
		 ,.Branch(Branch),.MemRead(MemRead)
		,.MemWrite(MemWrite),.ALUOp(ALUOp),.ALUF(ALUF)
		,.MemtoReg(MemtoReg),.ALUSrc(ALUSrc)
		,.RegWrite(RegWrite),.Dump(dump),.rst(rst));


   
endmodule // proc
// DUMMY LINE FOR REV CONTROL :0:

