//John Vennard & Nick Ambur
//Fetch Module
module fetch(PCS,PC_IDEX,Dump,clk,rst,PC_IFID,PC2_IFID,instr_IFID,takeBranch
            ,takeBranch_EXMEM,stallCtrl,halt_IFID,halt_MEMWB,err,startStall);

input [15:0] PCS,PC_IDEX;
input clk,rst,Dump,stallCtrl,takeBranch_EXMEM,halt_MEMWB,takeBranch,startStall;
output [15:0] instr_IFID, PC2_IFID,PC_IFID;
output halt_IFID,err;
wire [15:0] PC_FF_in,addr, pcCurrent,dummy,instrTemp ;
wire dummy1,halt,haltTemp,haltTemp2;
//changed wires for pipelining
wire [15:0] instr,PC2,PC2_out,instrTempIn,pcCurrTemp;
/*
 * Pipelined register output
*/
reg16bit reg0(.clk(clk),.rst(rst),.en(~stallCtrl),.in(instrTempIn),.out(instrTemp));
reg16bit reg1(.clk(clk),.rst(rst),.en(1'b1),.in(PC2_out),.out(PC2_IFID));
dff_en reg2(.out(halt_IFID),.in(haltTemp),.en(1'b1),.clk(clk),.rst(rst));
reg16bit reg3(.clk(clk),.rst(rst),.en(1'b1),.in(PC_FF_in),.out(PC_IFID));

//convoluted clear for halt TODO Fri 19 Apr 2013 09:21:19 PM CDT
assign haltTemp = takeBranch_EXMEM ? 1'b0 : halt;
assign haltTemp2 = takeBranch_EXMEM ? 1'b0 : halt_MEMWB;
//INSERT NOP IF YOU BRANCH TODO current Fri 19 Apr 2013 06:01:08 PM CDT OR
//STALL TODO Fri 19 Apr 2013 10:01:33 PM CDT
assign instrTempIn = (takeBranch_EXMEM | stallCtrl) ? (16'b00001_00000000000) : instr;
assign instr_IFID = (takeBranch_EXMEM) ? (16'b00001_00000000000) : instrTemp;

//Create PC FF
//	--always enabled
reg16bit pcReg0(.clk(clk),.rst(rst),.en((~halt_MEMWB)|(~stallCtrl)),.in(PC_FF_in),.out(pcCurrTemp));

//TODO working on pcCurrent Fri 19 Apr 2013 06:39:29 PM CDT
assign pcCurrent = startStall ? PC_IDEX : pcCurrTemp;


//Instantiate Fetch Memory
//Grounded enable and createdump
//instrMem imem(.data_out(instr), .addr(pcCurrent),.clk(clk),.rst(rst));
memory2c imem (.data_out(instr), .data_in(dummy), .addr(pcCurrent), .enable(1'b1), .wr(1'b0),
    .createdump(Dump), .clk(clk), .rst(rst));

//assign addr = (takeBranch_EXMEM) ? PC_FF_in : pcCurrent;

//Instantiate 16bit Adder
carryLA_16b adder0(.A(pcCurrent),.B(16'h0002),.SUM(PC2),.CI(1'b0),.CO(dummy1),.Ofl(err));
carryLA_16b adder1(.A(PC_FF_in),.B(16'h0002),.SUM(PC2_out),.CI(1'b0),.CO(dummy1),.Ofl(err));

//PC select mux logic w/ pipeline logic
assign PC_FF_in = (takeBranch_EXMEM) ? PCS : (stallCtrl ? pcCurrTemp : PC2);
assign halt = ~(|instr);

endmodule
