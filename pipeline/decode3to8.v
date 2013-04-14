//John Vennard
//ECE 552 
//3-to-8 Decoder
module decode3to8(in,out);
input [2:0] in;
output [7:0] out;
wire [2:0] in_n;

assign in_n = ~in;

nor3 n0(.in1(in[0]),.in2(in[1]),.in3(in[2]),.out(out[0]));	//000
nor3 n1(.in1(in_n[0]),.in2(in[1]),.in3(in[2]),.out(out[1]));//001	
nor3 n2(.in1(in[0]),.in2(in_n[1]),.in3(in[2]),.out(out[2]));//010
nor3 n3(.in1(in_n[0]),.in2(in_n[1]),.in3(in[2]),.out(out[3]));//011
nor3 n4(.in1(in[0]),.in2(in[1]),.in3(in_n[2]),.out(out[4]));//100
nor3 n5(.in1(in_n[0]),.in2(in[1]),.in3(in_n[2]),.out(out[5]));//101
nor3 n6(.in1(in[0]),.in2(in_n[1]),.in3(in_n[2]),.out(out[6]));//110
nor3 n7(.in1(in_n[0]),.in2(in_n[1]),.in3(in_n[2]),.out(out[7]));//111

endmodule
