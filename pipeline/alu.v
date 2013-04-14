module alu (A, B, Op, invA, invB, sign, Out, Ofl, Z, CO, err);
   
        input [15:0] A;
        input [15:0] B;
        input [3:0] Op;
        input invA;
        input invB;
        input sign;
        output [15:0] Out;
        output Ofl;
        output Z;
        output CO;
        output reg err;

        reg[15:0] Out;

        wire[15:0] shifterOut, adderOut, subAdderOut, Ainv, Binv;
        reg[15:0] subAdderA, Ain, Bin;
        wire signOfl, subSignOfl, dummyCO;

        //assign Binv = (invB) ? ~B : B;

        // carryLA_16b adder overflow bit is a signed overflow bit
        // Also, Ofl bit is held low if we are not adding
        assign Ofl = (Op == 3'b100) ? ((sign) ? signOfl : CO) : 1'b0;
        assign Z = ~(|Out);

        shifter SHIFT(.In(A), .Cnt(B[3:0]), .Op(Op[1:0]), .Out(shifterOut));
        carryLA_16b CLA(.A(Ain), .B(Bin), .SUM(adderOut), .CI(1'b0), .CO(CO), .Ofl(signOfl));
        carryLA_16b CLASUB(.A(subAdderA), .B(16'h0001), .SUM(subAdderOut), .CI(1'b0), .CO(dummyCO), .Ofl(subSignOfl));

        always @(*) begin
            subAdderA = 16'hxxxx;
            case(Op)
                3'b000: begin // rotate left
                    Out = shifterOut;
                    Ain = 16'hxxxx;
                    Bin = 16'hxxxx;
                    err = 1'b0;
                end
                3'b001: begin // shift left
                    Out = shifterOut;
                    Ain = 16'hxxxx;
                    Bin = 16'hxxxx;
                    err = 1'b0;
                end
                3'b010: begin // rotate right
                    Out = shifterOut;
                    Ain = 16'hxxxx;
                    Bin = 16'hxxxx;
                    err = 1'b0;
                end
                3'b011: begin // shift right logical
                    Out = shifterOut;
                    Ain = 16'hxxxx;
                    Bin = 16'hxxxx;
                    err = 1'b0;
                end
                3'b100: begin // ADD
                    Out = adderOut;
                    Ain = A;
                    Bin = B;
                    err = 1'b0;
                end
                3'b101: begin // XOR
                    Out = A ^ B;
                    Ain = 16'hxxxx;
                    Bin = 16'hxxxx;
                    err = 1'b0;
                end
                3'b110: begin // AND 
                    Out = (invB) ? (A & (~B)) : (A & B);
                    Ain = 16'hxxxx;
                    Bin = 16'hxxxx;
                    err = 1'b0;
                end
                4'b0111: begin // SUB
                    Out = adderOut;
                    Ain = A;
                    Bin = subAdderOut;
                    subAdderA = ~B;
                    err = 1'b0;
                end
                4'b1000: begin // SUB
                    Out = adderOut;
                    Ain = subAdderOut;
                    Bin = B;
                    subAdderA = ~A;
                    err = 1'b0;
                end
                default: begin
                    Ain = 16'hxxxx;
                    Bin = 16'hxxxx;
                    err = 1'b1;
                end
            endcase
        end
endmodule
