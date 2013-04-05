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
	wire [15:0] instr,writeData,rd1,rd2,pcNext,pc2,exOut,rdD,imm;
	wire [4:0] aluOp;
	wire [2:0] flag;
	wire [1:0] aluF;
	//control wires
	wire memWrite,memRead,zeroEx,dump,halt,memToReg,jump,branch,aluSrc,regWrite;
	wire [1:0] regDst,size;

	//error wires
	wire err_fetch,err_decode,err_execute;

    //assign err = err_fetch | err_decode | err_execute;
    assign err = 1'b0;

	//Fetch Stage
	fetch fetch0(.pcNext(pcNext),.halt(halt),.jump(jump),.branch(branch),.dump(dump),.pc2(pc2),.instr(instr)
	,.err(err_fetch),.clk(clk),.rst(rst));

	//Decode Stage
	decode decode0(.instr(instr),.size(size),.zeroEx(zeroEx),.imm(imm),.writeData(writeData),.regDst(regDst)
	,.regWrite(regWrite),.rd1(rd1),.rd2(rd2)
	,.err(err_decode),.clk(clk),.rst(rst));

	//Execute Stage
	execute ex(.pc2(pc2),.aluSrc(aluSrc),.aluOp(aluOp),.rd1(rd1),.rd2(rd2),.imm(imm),.aluF(aluF), .jump(jump), .branch(branch)
		,.pcNext(pcNext),.flag(flag),.exOut(exOut),.err(err_execute));

	//Mem Stage
    //TODO CHANGED Mem_Access -> memory for testing
	memory memory0(.exOut(exOut),.dataIn(rd2),.rdD(rdD)
	,.memWrite(memWrite),.memRead(memRead),.dump(dump)
	,.clk(clk),.rst(rst));

	//Write Back Stage
	writeBack wb(.rdD(rdD),.writeData(writeData),.exOut(exOut),.memToReg(memToReg));

	//Control Module
	control ctrl(.instr(instr),.size(size),.halt(halt),.zeroEx(zeroEx)
	   ,.regDst(regDst),.jump(jump)
		 ,.branch(branch),.memRead(memRead)
		,.memWrite(memWrite),.aluOp(aluOp),.aluF(aluF)
		,.memToReg(memToReg),.aluSrc(aluSrc)
		,.regWrite(regWrite),.dump(dump),.rst(rst));


   
endmodule // proc
// DUMMY LINE FOR REV CONTROL :0:

