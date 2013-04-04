//John Vennard
//ECE552 HW1 #1-3
module mux4_1(InA,InB,InC,InD,S,Out);
input InA,InB,InC,InD;
input [1:0] S;
output Out;
wire a,b;

mux2_1 mux1(.InA(InA),.InB(InB),.S(S[0]),.Out(a));
mux2_1 mux2(.InA(InC),.InB(InD),.S(S[0]),.Out(b));
mux2_1 mux3(.InA(a),.InB(b),.S(S[1]),.Out(Out));

endmodule
