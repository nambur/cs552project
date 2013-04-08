//John Vennard and Nick Ambur
//Write Back Stage
module write_back(RdD,WrD,ALUO,MemtoReg);
input [15:0] RdD,ALUO;
input MemtoReg;

output [15:0] WrD;

assign WrD = MemtoReg ? RdD : ALUO;

endmodule
