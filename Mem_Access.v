//John Vennard and Nick Ambur
//Memory Access Module
module Mem_Access(aluResult,writeData,RdD,memWrite,memRead,dump,clk,rst);
input [15:0] aluResult,writeData;
input memWrite,memRead,dump,clk,rst;
output [15:0] RdD;

wire memReadorWrite,wr;
//Instantiate Provided Memory Module
dataMem mem(.data_out(RdD),.data_in(writeData),.addr(aluResult)
		,.wr(MemWrite),.createdump(dump)
		,.clk(clk),.rst(rst));

//logic for enable
assign memReadorWrite = memRead|MemWrite;

endmodule



