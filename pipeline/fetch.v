//John Vennard & Nick Ambur
//Fetch Module
module fetch(PCS,Dump,clk,rst,PC_IFID,PC2_IFID,instr_IFID,takeBranch,takeBranch_EXMEM,stallCtrl,halt_IFID,halt_MEMWB,err);

input [15:0] PCS;
input clk,rst,Dump,stallCtrl,takeBranch_EXMEM,halt_MEMWB,takeBranch;
output [15:0] instr_IFID, PC2_IFID,PC_IFID;
output halt_IFID,err;
wire [15:0] PC_FF_in,addr, pcCurrent,dummy ;
wire dummy1,halt,haltTemp;
//changed wires for pipelining
wire [15:0] instr,PC2;
/*
 * Pipelined register output
*/
reg16bit reg0(.clk(clk),.rst(rst),.en(~stallCtrl),.in(instr),.out(instr_IFID));
reg16bit reg1(.clk(clk),.rst(rst),.en(1'b1),.in(PC2),.out(PC2_IFID));
reg16bit reg3(.clk(clk),.rst(rst),.en(1'b1),.in(PC_FF_in),.out(PC_IFID));
dff_en reg2(.out(halt_IFID),.in(halt),.en(1'b1),.clk(clk),.rst(rst));

assign haltTemp = (takeBranch) ? 1'b0 : halt;

//Create PC FF
//	--always enabled
reg16bit pcReg0(.clk(clk),.rst(rst),.en(~haltTemp),.in(PC_FF_in),.out(pcCurrent));


//Instantiate Fetch Memory
//Grounded enable and createdump
//instrMem imem(.data_out(instr), .addr(pcCurrent),.clk(clk),.rst(rst));
memory2c imem (.data_out(instr), .data_in(dummy), .addr(pcCurrent), .enable(1'b1), .wr(1'b0),
    .createdump(Dump), .clk(clk), .rst(rst));

//assign addr = (takeBranch_EXMEM) ? PC_FF_in : pcCurrent;

//Instantiate 16bit Adder
carryLA_16b adder0(.A(pcCurrent),.B(16'h0002),.SUM(PC2),.CI(1'b0),.CO(dummy1),.Ofl(err));

//PC select mux logic w/ pipeline logic
assign PC_FF_in = (takeBranch) ? PCS : (stallCtrl ? pcCurrent : PC2);
assign halt = ~(|instr);

endmodule
