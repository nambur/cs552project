module reg2bit(clk, rst, en, in, out);
input [1:0] in;
output [1:0] out;
input clk, rst, en;

dff_en reg0(.out(out[0]),.in(in[0]),.en(en),.clk(clk),.rst(rst));
dff_en reg1(.out(out[1]),.in(in[1]),.en(en),.clk(clk),.rst(rst));

endmodule
