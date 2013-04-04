//John Vennard & Nick Ambur
//Fetch Module
module fetch(pcNext,Jump,Branch,Dump,clk,rst,halt,PC2,instr,err);
input [15:0] pcNext;
input Jump,Branch,clk,halt,rst,Dump;
output [15:0] instr, PC2;
output err;

wire [15:0] PC_FF_in, pcCurrent, dummy, dummy1;
wire first, first_n;

//Create PC FF
//	--always enabled
reg16bit pcReg0(.clk(clk),.rst(rst),.en(~halt),.in(PC_FF_in),.out(pcCurrent));

//Instantiate Fetch Memory
//Grounded enable and createdump
//instrMem imem(.data_out(instr), .addr(pcCurrent),.clk(clk),.rst(rst));
memory2c imem (.data_out(instr), .data_in(dummy), .addr(pcCurrent), .enable(1'b1), .wr(1'b0),
    .createdump(Dump), .clk(clk), .rst(rst));

//Instantiate 16bit Adder
carryLA_16b adder(.A(pcCurrent),.B(16'h0002),.SUM(PC2),.CI(1'b0),.CO(dummy1),.Ofl(err));

//PC select mux logic
assign PC_FF_in = (Jump|Branch) ? pcNext : PC2;

endmodule
