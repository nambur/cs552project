module shifter (In, Cnt, Op, Out);
   input [15:0] In;
   input [3:0]  Cnt;
   input [1:0]  Op;
   output reg [15:0] Out;
   wire [15:0] a,b,c,d, e;
   
   rotate_left shift0(.In(In),.Cnt(Cnt),.Out(a));
   shift_left shift2(.In(In),.Cnt(Cnt),.Out(b));
   rotate_right shift1(.In(In),.Cnt(Cnt),.Out(c));
   shift_right_log shift4(.In(In),.Cnt(Cnt),.Out(d));
   
   always @(*) begin
        casex (Op)
            2'b00: Out = a;
            2'b01: Out = b;
            2'b10: Out = c;
            2'b11: Out = d;
            default: Out = 16'hxxxx;
        endcase
   end
   
endmodule
