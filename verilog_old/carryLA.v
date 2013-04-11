module carryLA(G, P, C, Out);
    input G, P, C;
    output Out;

    assign Out = G | (P & C);
endmodule
