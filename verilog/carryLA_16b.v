// 16-bit full adder from 4-bit full adders
module carryLA_16b(A, B, SUM, CI, CO, Ofl);
    input[15:0] A, B;
    input CI;
    output[15:0] SUM;
    output CO, Ofl;
    wire C1, C2, C3;
    wire dummy0, dummy1, dummy2;

    carryLA_4b CLA3T0(.A(A[3:0]), .B(B[3:0]), .SUM(SUM[3:0]), .CI(CI), .CO(C1), .Ofl(dummy0));
    carryLA_4b CLA7T4(.A(A[7:4]), .B(B[7:4]), .SUM(SUM[7:4]), .CI(C1), .CO(C2), .Ofl(dummy1));
    carryLA_4b CLA11T8(.A(A[11:8]), .B(B[11:8]), .SUM(SUM[11:8]), .CI(C2), .CO(C3), .Ofl(dummy2));
    // we are only concerned with the overflow of the final adder
    carryLA_4b CLA15T12(.A(A[15:12]), .B(B[15:12]), .SUM(SUM[15:12]), .CI(C3), .CO(CO), .Ofl(Ofl));
endmodule
