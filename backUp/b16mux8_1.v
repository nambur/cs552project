//16-bit mux 8 to 1
module b16mux8_1(in, s, out);
input [127:0] in;	//8 16 bit inputs
input [2:0] s;
output [15:0] out;
wire [15:0] a,b,c,d,e,f;

//first select level
b16mux2_1 mux0(.InA(in[15:0]),.InB(in[31:16]),.S(s[0]),.Out(a));
b16mux2_1 mux1(.InA(in[47:32]),.InB(in[63:48]),.S(s[0]),.Out(b));
b16mux2_1 mux2(.InA(in[79:64]),.InB(in[95:80]),.S(s[0]),.Out(c));
b16mux2_1 mux3(.InA(in[111:96]),.InB(in[127:112]),.S(s[0]),.Out(d));
//second select level
b16mux2_1 mux4(.InA(a),.InB(b),.S(s[1]),.Out(e));
b16mux2_1 mux5(.InA(c),.InB(d),.S(s[1]),.Out(f));
//last level
b16mux2_1 mux6(.InA(e),.InB(f),.S(s[2]),.Out(out));

endmodule