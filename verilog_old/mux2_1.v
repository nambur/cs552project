//John Vennard
//ECE552 HW1 #1
module mux2_1(InA,InB,S,Out);
input InA, InB, S;
output Out;
wire nS,a,b;

not1 notgate(.in1(S),.out(nS));
nand2 gate1(.in1(InA),.in2(nS),.out(a));
nand2 gate2(.in1(InB),.in2(S),.out(b));
nand2 gate3(.in1(a),.in2(b),.out(Out));

endmodule
