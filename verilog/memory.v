//NEW MEMORY MODULE
//John Vennard and Nick Ambur
module memory(aluResult,writeData,
RdD,memWrite,memRead,dump,clk,rst);

input [15:0] aluResult,writeData;
input memWrite,memRead,dump,clk,rst;
output [15:0] RdD;

wire memReadorWrite;

//enable logic
assign memReadorWrite = (memWrite | memRead);


//Instantiate GIVEN MEMORY BLOCK --- NO CHANGES
memory2c mem(.data_out(RdD),.data_in(writeData),
    .addr(aluResult), .enable(memReadorWrite), .wr(memWrite),
    .createdump(dump), 
    .clk(clk), .rst(rst));

endmodule
 
