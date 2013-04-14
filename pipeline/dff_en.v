//Single bit register with enable
module dff_en(in,out,en,clk,rst);
input in,en,clk,rst;
output out;
wire d;

mux2_1 mux0(.InA(out),.InB(in),.S(en),.Out(d));
dff reg0(.d(d),.q(out),.clk(clk),.rst(rst));

endmodule
