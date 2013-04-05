//NEW MEMORY MODULE
//John Vennard and Nick Ambur
module memory(exOut,dataIn,
rdD,memWrite,memRead,dump,clk,rst);

input [15:0] exOut,dataIn;
input memWrite,memRead,dump,clk,rst;
output [15:0] rdD;

wire memReadorWrite;

//enable logic
assign memReadorWrite = (memWrite | memRead);


//Instantiate GIVEN MEMORY BLOCK --- NO CHANGES
memory2c mem(.data_out(rdD),.data_in(dataIn),
    .addr(exOut), .enable(memReadorWrite), .wr(memWrite),
    .createdump(dump), 
    .clk(clk), .rst(rst));

endmodule
 
