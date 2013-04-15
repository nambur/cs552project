//John Vennard & Nick Ambur
//Fetch Module
module fetch(PCS,Dump,clk,rst,PC2_IFID,instr_IFID,takeBranch_EXMEM,stallCtrl,halt_IFID,err);

input [15:0] PCS;
input clk,rst,Dump,stallCtrl,takeBranch_EXMEM;
output [15:0] instr_IFID, PC2_IFID;
output halt_IFID,err;
wire [15:0] PC_FF_in, pcCurrent,dummy ;
wire dummy1,halt,haltTemp;
//changed wires for pipelining
wire [15:0] instr,PC2;
/*
 * Pipelined register output
*/
reg16bit reg0(.clk(clk),.rst(rst),.en(~stallCtrl),.in(instr),.out(instr_IFID));
reg16bit reg1(.clk(clk),.rst(rst),.en(1'b1),.in(pcCurrent),.out(PC2_IFID));
dff_en reg2(.out(halt_IFID),.in(haltTemp),.en(1'b1),.clk(clk),.rst(rst));

assign haltTemp = (takeBranch_EXMEM) ? 1'b0 : halt;

//Create PC FF
//	--always enabled
reg16bit pcReg0(.clk(clk),.rst(rst),.en(~haltTemp),.in(PC_FF_in),.out(pcCurrent));


//Instantiate Fetch Memory
//Grounded enable and createdump
//instrMem imem(.data_out(instr), .addr(pcCurrent),.clk(clk),.rst(rst));
memory2c imem (.data_out(instr), .data_in(dummy), .addr(pcCurrent), .enable(1'b1), .wr(1'b0),
    .createdump(Dump), .clk(clk), .rst(rst));

//Instantiate 16bit Adder
carryLA_16b adder0(.A(pcCurrent),.B(16'h0002),.SUM(PC2),.CI(1'b0),.CO(dummy1),.Ofl(err));

//PC select mux logic w/ pipeline logic
assign PC_FF_in = (takeBranch_EXMEM) ? PCS : (stallCtrl ? pcCurrent : PC2);
assign halt = ~(|instr);

endmodule
