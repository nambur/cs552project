//John Vennard and Nick Ambur
//Write Back Stage
module writeBack(RdD_MEMWB,WrD,ALUO_MEMWB,MemtoReg_MEMWB);
input [15:0] RdD_MEMWB,ALUO_MEMWB;
input MemtoReg_MEMWB;

output [15:0] WrD;

assign WrD = MemtoReg_MEMWB ? RdD_MEMWB : ALUO_MEMWB;

endmodule
