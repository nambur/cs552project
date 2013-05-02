module forwarding (Rd1Addr_IDEX,Rd2Addr_IDEX,WrR_MEMWB,WrR_EXMEM,takeBranch,loadDetect_EXMEM
                    ,forwardA,forwardB,RegWrite_EXMEM,RegWrite_MEMWB,takeBranch_EXMEM);

input [2:0] WrR_EXMEM,WrR_MEMWB,Rd1Addr_IDEX,Rd2Addr_IDEX;
input RegWrite_EXMEM,RegWrite_MEMWB,takeBranch_EXMEM,takeBranch,loadDetect_EXMEM;
output [1:0] forwardA,forwardB;
//forwardA -- 0 = pass Rd1_IDEX, 1 = pass WrD_MEMWB, 2 = pass WrD_EXMEM
//forwardB -- 0 = pass Rd2_IDEX, 1 = pass WrD_MEMWB, 2 = pass WrD_EXMEM

assign forwardA[0] = (forwardA[1]) ? 1'b0 : (RegWrite_MEMWB&(Rd1Addr_IDEX==WrR_MEMWB));
assign forwardA[1] = loadDetect_EXMEM ? 1'b0 : (RegWrite_EXMEM&(Rd1Addr_IDEX==WrR_EXMEM));
//assign forwardA[1] = (takeBranch|takeBranch_EXMEM) ? 1'b0 : (RegWrite_EXMEM&(Rd1Addr_IDEX==WrR_EXMEM));

assign forwardB[0] =  forwardB[1] ? 1'b0 : (RegWrite_MEMWB&(Rd2Addr_IDEX==WrR_MEMWB));
assign forwardB[1] = loadDetect_EXMEM ? 1'b0 : (RegWrite_EXMEM&(Rd2Addr_IDEX==WrR_EXMEM));


endmodule
