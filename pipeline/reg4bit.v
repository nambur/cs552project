module reg4bit(clk, rst, en, in, out);
input [3:0] in;
output [3:0] out;
input clk, rst, en;

dff_en reg0(.out(out[0]),.in(in[0]),.en(en),.clk(clk),.rst(rst));
dff_en reg1(.out(out[1]),.in(in[1]),.en(en),.clk(clk),.rst(rst));
dff_en reg2(.out(out[2]),.in(in[2]),.en(en),.clk(clk),.rst(rst));
dff_en reg3(.out(out[3]),.in(in[3]),.en(en),.clk(clk),.rst(rst));

endmodule
