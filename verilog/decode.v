//John Vennard & Nick Ambur
//552 Project Decode Module
module decode(Instr,size, zeroEx, writeData,RegDst,RegWrite,
			clk,rst,Rd1,Rd2,err,Imm);
//Inputs
input [15:0] Instr,writeData;
input [1:0] RegDst,size;
input RegWrite, zeroEx, clk,rst;
//Output
output [15:0] Rd1,Rd2;
output err;
output reg [15:0] Imm;

always @(*) begin
    casex({zeroEx,size})
        3'b000: Imm = {{11{Instr[4]}},Instr[4:0]};
        3'b100: Imm = {11'b000,Instr[4:0]};
        3'b001: Imm = {{8{Instr[7]}},Instr[7:0]};
        3'b101: Imm = {8'h00,Instr[7:0]};
        3'b010: Imm = {{5{Instr[10]}},Instr[10:0]};
        3'b110: Imm = {5'h00,Instr[10:0]};
        default: Imm = 16'hxxxx;
    endcase
end

//Internal Wires
wire [2:0] WrR;	//Holds address of register to write to

//Write register logic
//RegDst - WrR
//00 - Inst[7:5] -- Rd for I-format 1 
//01 - Inst[4:2] -- Rd for R-format
//10 - Inst[10:8] -- Rs for I-format 2
//11 - R7
assign WrR = RegDst[1] ? (RegDst[0] ? 3'b111 : Instr[10:8]) : 
		(RegDst[0] ? Instr[4:2] : Instr[7:5]);

//Instantiate register file with bypassing
//8 16bit registers 
rf regFile0(.read1data(Rd1),.read2data(Rd2),.err(err)//Outputs
		
		,.clk(clk),.rst(rst)			//Inputs
		,.read1regsel(Instr[10:8]),.read2regsel(Instr[7:5])	
		,.writeregsel(WrR),.writedata(writeData),.write(RegWrite));

endmodule


    
