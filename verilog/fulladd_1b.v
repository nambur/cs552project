// 1-bit full adder from nand, nor, and not gates
module fulladd_1b(A, B, Cin, S, Cout);
    input A, B, Cin;
    output S, Cout;
    wire xor1o, nand1o, nand2o, nor1o;
    wire notNand1o, notNand2o;

    xor2 XOR1(.in1(A), .in2(B), .out(xor1o));
    xor2 XOR2(.in1(xor1o), .in2(Cin), .out(S));
    nand2 NAND1(.in1(xor1o), .in2(Cin), .out(nand1o));
    nand2 NAND2(.in1(A), .in2(B), .out(nand2o));
    not1 NOT1(.in1(nand1o), .out(notNand1o));
    not1 NOT2(.in1(nand2o), .out(notNand2o));
    nor2 NOR1(.in1(notNand1o), .in2(notNand2o), .out(nor1o));
    not1 NOT3(.in1(nor1o), .out(Cout));
endmodule
