//John Vennard & Nick Ambur
//Fetch Module
module fetch(PCS,Jump,Dump,clk,rst,halt,PC2_IFID,instr_IFID,takeBranch_EXMEM,stallCtrl,err);

input [15:0] PCS;
input Jump,clk,halt,rst,Dump,stallCtrl,takeBranch_EXMEM;
output [15:0] instr_IFID, PC2_IFID;
output err;
wire [15:0] PC_FF_in, pcCurrent, dummy;
wire first, first_n,dummy1;
//changed wires for pipelining
wire [15:0] instr,PC2,jumpPC;
/*
 * Pipelined register output
*/
reg16bit reg0(.clk(clk),.rst(rst),.en(1'b1),.in(instr),.out(instr_IFID));
reg16bit reg1(.clk(clk),.rst(rst),.en(1'b1),.in(PC2),.out(PC2_IFID));

//Create PC FF
//	--always enabled
reg16bit pcReg0(.clk(clk),.rst(rst),.en(~halt),.in(PC_FF_in),.out(pcCurrent));

//Instantiate Fetch Memory
//Grounded enable and createdump
//instrMem imem(.data_out(instr), .addr(pcCurrent),.clk(clk),.rst(rst));
memory2c imem (.data_out(instr), .data_in(dummy), .addr(pcCurrent), .enable(1'b1), .wr(1'b0),
    .createdump(Dump), .clk(clk), .rst(rst));

//Instantiate 16bit Adder
carryLA_16b adder0(.A(pcCurrent),.B(16'h0002),.SUM(PC2),.CI(1'b0),.CO(dummy1),.Ofl(err));

//Jump PC calc result
carryLA_16b adder1(.A(PC2),.B({{5{instr_IFID[10]}},instr_IFID[10:0]}),.SUM(jumpPC),.CI(1'b0),.CO(dummy1),.Ofl(err));

//PC select mux logic w/ pipeline logic
assign PC_FF_in = takeBranch_EXMEM ? PCS : (Jump ?  jumpPC : (stallCtrl ? pcCurrent : PC2));

endmodule
