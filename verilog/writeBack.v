//John Vennard and Nick Ambur
//Write Back Stage
module writeBack(rdD,writeData,exOut,memToReg);
input [15:0] rdD,exOut;
input memToReg;

output [15:0] writeData;

assign writeData = memToReg ? rdD : exOut;

endmodule
