// 4-bit carry lookahead adder from 1-bit full adders
module carryLA_4b(A, B, SUM, CI, CO, Ofl);
    input[3:0] A, B;
    input CI;
    output[3:0] SUM;
    output CO, Ofl;
    wire c1, c2, c3;
    wire g0, g1, g2, g3;
    wire p0, p1, p2, p3;
    wire dummy0, dummy1, dummy2, dummy3;

    generateLA G0(.A(A[0]), .B(B[0]), .Out(g0));
    generateLA G1(.A(A[1]), .B(B[1]), .Out(g1));
    generateLA G2(.A(A[2]), .B(B[2]), .Out(g2));
    generateLA G3(.A(A[3]), .B(B[3]), .Out(g3));

    propagateLA P0(.A(A[0]), .B(B[0]), .Out(p0));
    propagateLA P1(.A(A[1]), .B(B[1]), .Out(p1));
    propagateLA P2(.A(A[2]), .B(B[2]), .Out(p2));
    propagateLA P3(.A(A[3]), .B(B[3]), .Out(p3));

    carryLA C1(.G(g0), .P(p0), .C(CI), .Out(c1));
    carryLA C2(.G(g1), .P(p1), .C(c1), .Out(c2));
    carryLA C3(.G(g2), .P(p2), .C(c2), .Out(c3));
    carryLA C4(.G(g3), .P(p3), .C(c3), .Out(CO));

    // detects a signed addition overflow
    assign Ofl = CO ^ c3;

    // we don't care about the carry out bit on the full adder
    // so it is not connected
    fulladd_1b FA0(.A(A[0]), .B(B[0]), .Cin(CI), .S(SUM[0]), .Cout(dummy0));
    fulladd_1b FA1(.A(A[1]), .B(B[1]), .Cin(c1), .S(SUM[1]), .Cout(dummy1));
    fulladd_1b FA2(.A(A[2]), .B(B[2]), .Cin(c2), .S(SUM[2]), .Cout(dummy2));
    fulladd_1b FA3(.A(A[3]), .B(B[3]), .Cin(c3), .S(SUM[3]), .Cout(dummy3));
endmodule
