module hazardDetect(MemRead_IDEX,Rd2Addr_IDEX,Rd1_IFID,Rd2_IFID,Branch_EXMEM
                    ,stallCtrl);
input [2:0] Rd2Addr_IDEX,Rd1_IFID,Rd2_IFID;
input MemRead_IDEX,Branch_EXMEM;
input clk,rst
//output
output stallCtrl;

wire stall2,a,b,c,flag,check,checkrst;
wire flush;
//flag that allows stall to run twice
dff_en(.clk(clk),.rst(rst),.en(1'b1),.in(stall2),.out(check));

//stall logic
assign a = (Rd2_IDEX == Rd1_IFID);
assign b = (Rd2_IDEX == Rd2_IFID);
assign c = a|b;
assign stall2 = MemRead_IDEX ? (c ? 1'b1 : 1'b0) : 1'b0;
assign stallCtrl = (check | stall2);
assign checkrst = (check|rst);

endmodule
