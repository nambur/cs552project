
module shift_right_log(In,Cnt,Out);
input [15:0] In;
input [3:0] Cnt;
output [15:0] Out;
wire [15:0] a,b,c;

b16mux2_1 mux1(.InA(In),.InB({1'b0,In[15:1]}),.S(Cnt[0]),.Out(a));
b16mux2_1 mux2(.InA(a),.InB({2'b00,a[15:2]}),.S(Cnt[1]),.Out(b));
b16mux2_1 mux3(.InA(b),.InB({4'b0000,b[15:4]}),.S(Cnt[2]),.Out(c));
b16mux2_1 mux4(.InA(c),.InB({8'b00000000,c[15:8]}),.S(Cnt[3]),.Out(Out));

endmodule

