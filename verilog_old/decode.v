//John Vennard & Nick Ambur
//552 Project Decode Module
module decode(instr,size, zeroEx, writeData,regDst,regWrite,
			clk,rst,rd1,rd2,err,imm);
//Inputs
input [15:0] instr,writeData;
input [1:0] regDst,size;
input regWrite, zeroEx, clk,rst;
//Output
output [15:0] rd1,rd2;
output err;
output reg [15:0] imm;

always @(*) begin
    casex({zeroEx,size})
<<<<<<< HEAD
        3'b000: imm = {{11{instr[4]}},instr[4:0]};
        3'b100: imm = {11'b000,instr[4:0]};
        3'b001: imm = {{8{instr[7]}},instr[7:0]};
        3'b101: imm = {8'h00,instr[7:0]};
        3'b010: imm = {{5{instr[10]}},instr[10:0]};
        3'b110: imm = {5'h00,instr[10:0]};
        default: imm = 16'hxxxx;
=======
        3'b000: Imm = {{11{Instr[4]}},Instr[4:0]};
        3'b100: Imm = {11'b000,Instr[4:0]};
        3'b001: Imm = {{8{Instr[7]}},Instr[7:0]};
        3'b101: Imm = {8'h00,Instr[7:0]};
        3'b010: Imm = {{5{Instr[10]}},Instr[10:0]};
        3'b110: Imm = {5'h00,Instr[10:0]};
        default: Imm = 16'h0000;
>>>>>>> 22d92accdabc6edd4b2d3168dfe511ab1bdce9fb
    endcase
end

//Internal Wires
<<<<<<< HEAD
wire [2:0] wrReg;	//Holds address of register to write to
=======
wire [2:0] WrR;	//Holds address of register to write to
//added for bypassing
wire [15:0] out1data,out2data;
wire mux1sel,mux2sel;
>>>>>>> 22d92accdabc6edd4b2d3168dfe511ab1bdce9fb

//Write register logic
//regDst - wrReg
//00 - Inst[7:5] -- Rd for I-format 1 
//01 - Inst[4:2] -- Rd for R-format
//10 - Inst[10:8] -- Rs for I-format 2
//11 - R7
assign wrReg = regDst[1] ? (regDst[0] ? 3'b111 : instr[10:8]) : 
		(regDst[0] ? instr[4:2] : instr[7:5]);

//Instantiate register file with bypassing
//8 16bit registers 
<<<<<<< HEAD
rf regFile0(.read1data(rd1),.read2data(rd2),.err(err)//Outputs
=======
rf regFile0(.read1data(out1data),.read2data(out2data),.err(err)//Outputs
>>>>>>> 22d92accdabc6edd4b2d3168dfe511ab1bdce9fb
		
		,.clk(clk),.rst(rst)			//Inputs
		,.read1regsel(instr[10:8]),.read2regsel(instr[7:5])	
		,.writeregsel(wrReg),.writedata(writeData),.write(regWrite));

//ADDED BYPASS LOGIC
//assign mux1sel = (RegWrite&(WrR==Instr[10:8])) ;
//assign mux2sel = (RegWrite&(WrR==Instr[7:5])) ;
assign Rd1 = out1data;
assign Rd2 = out2data;
//Need to add correct logic to above for register bypassing
endmodule


    
