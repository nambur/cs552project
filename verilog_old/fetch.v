//John Vennard & Nick Ambur
//Fetch Module
module fetch(pcNext,jump,branch,dump,clk,rst,halt,pc2,instr,err);
input [15:0] pcNext;
input jump,branch,clk,halt,rst,dump;
output [15:0] instr, pc2;
output err;

<<<<<<< HEAD
wire [15:0] inPCFF, pcCurrent;
wire dummy1;

//Create PC FF
//	--always enabled
reg16bit pcReg0(.clk(clk),.rst(rst),.en(~halt),.in(inPCFF),.out(pcCurrent));

//Instantiate Fetch Memory
//Grounded enable and createdump
//instrMem imem(.data_out(instr), .addr(pcCurrent),.clk(clk),.rst(rst));
memory2c imem (.data_out(instr), .data_in(16'hxxxx), .addr(pcCurrent), .enable(1'b1), .wr(1'b0),
    .createdump(dump), .clk(clk), .rst(rst));

//Instantiate 16bit Adder
carryLA_16b adder(.A(pcCurrent),.B(16'h0002),.SUM(pc2),.CI(1'b0),.CO(dummy1),.Ofl(err));
=======
wire [15:0] PC_FF_in, pcCurrent, dummy;
wire first, first_n,dummy1;

//PC FF
//	--enabled until halt=1
reg16bit pcReg0(.clk(clk),.rst(rst),.en(~halt),.in(PC_FF_in),.out(pcCurrent));

//Instantiate Fetch Memory
//Grounded enable and createdump
memory2c imem (.data_out(instr), .data_in(dummy), .addr(pcCurrent), .enable(1'b1), .wr(1'b0),
    .createdump(Dump), .clk(clk), .rst(rst));

//Instantiate 16bit Adder
//  --adds 2 to calculate PC2
carryLA_16b adder(.A(pcCurrent),.B(16'h0002),.SUM(PC2),.CI(1'b0),.CO(dummy1),.Ofl(err));
>>>>>>> 22d92accdabc6edd4b2d3168dfe511ab1bdce9fb


//PC select mux logic
assign inPCFF = (jump|branch) ? pcNext : pc2;

endmodule
