//John Vennard and Nick Ambur
module memory(exOut,dataIn,
rdD,memWrite,memRead,dump,clk,rst);

input [15:0] exOut,dataIn;
input memWrite,memRead,dump,clk,rst;
output [15:0] rdD;

wire memReadorWrite;

//enable logic
assign memReadorWrite = (memWrite | memRead);


<<<<<<< HEAD
//Instantiate GIVEN MEMORY BLOCK --- NO CHANGES
memory2c mem(.data_out(rdD),.data_in(dataIn),
    .addr(exOut), .enable(memReadorWrite), .wr(memWrite),
=======
//Instantiate memory2c --- NO CHANGES
memory2c mem(.data_out(RdD),.data_in(writeData),
    .addr(aluResult), .enable(memReadorWrite), .wr(memWrite),
>>>>>>> 22d92accdabc6edd4b2d3168dfe511ab1bdce9fb
    .createdump(dump), 
    .clk(clk), .rst(rst));

endmodule
 
