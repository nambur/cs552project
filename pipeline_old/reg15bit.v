module reg15bit(clk, rst, en, in, out);
input [14:0] in;
output [14:0] out;
input clk, rst, en;

dff_en reg0(.out(out[0]),.in(in[0]),.en(en),.clk(clk),.rst(rst));
dff_en reg1(.out(out[1]),.in(in[1]),.en(en),.clk(clk),.rst(rst));
dff_en reg2(.out(out[2]),.in(in[2]),.en(en),.clk(clk),.rst(rst));
dff_en reg3(.out(out[3]),.in(in[3]),.en(en),.clk(clk),.rst(rst));
dff_en reg4(.out(out[4]),.in(in[4]),.en(en),.clk(clk),.rst(rst));
dff_en reg5(.out(out[5]),.in(in[5]),.en(en),.clk(clk),.rst(rst));
dff_en reg6(.out(out[6]),.in(in[6]),.en(en),.clk(clk),.rst(rst));
dff_en reg7(.out(out[7]),.in(in[7]),.en(en),.clk(clk),.rst(rst));
dff_en reg8(.out(out[8]),.in(in[8]),.en(en),.clk(clk),.rst(rst));
dff_en reg9(.out(out[9]),.in(in[9]),.en(en),.clk(clk),.rst(rst));
dff_en reg10(.out(out[10]),.in(in[10]),.en(en),.clk(clk),.rst(rst));
dff_en reg11(.out(out[11]),.in(in[11]),.en(en),.clk(clk),.rst(rst));
dff_en reg12(.out(out[12]),.in(in[12]),.en(en),.clk(clk),.rst(rst));
dff_en reg13(.out(out[13]),.in(in[13]),.en(en),.clk(clk),.rst(rst));
dff_en reg14(.out(out[14]),.in(in[14]),.en(en),.clk(clk),.rst(rst));

endmodule
