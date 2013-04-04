module aluCtrl(ALUOp, ALUF, opOut, invB, immPass, doSLE, doSEQ, doSCO, doBTR, doSLBI, doSLT);
    input [4:0] ALUOp;
    input [1:0] ALUF;

    output reg [3:0] opOut;
    output invB, immPass, doSCO, doSLBI, doSLE, doBTR, doSEQ, doSLT;

    assign invB = (ALUOp == 5'b01011) | ((ALUOp == 5'b11011) & (ALUF == 2'b11));
    assign immPass = (ALUOp == 5'b11000) ? 1'b1 : 1'b0;
    assign doSLBI = (ALUOp == 5'b10010) ? 1'b1 : 1'b0;
    assign doSLT = (ALUOp == 5'b11101) ? 1'b1 : 1'b0; 
    assign doBTR = (ALUOp == 5'b11001) ? 1'b1 : 1'b0;
    assign doSCO = (ALUOp == 5'b11111) ? 1'b1 : 1'b0;
    assign doSEQ = (ALUOp == 5'b11100) ? 1'b1 : 1'b0;
    assign doSLE = (ALUOp == 5'b11110) ? 1'b1 : 1'b0;

    always @(*) begin
        casex ({ALUF, ALUOp})
            7'bxx_01000: opOut = 4'b0100; // addi
            7'bxx_01001: opOut = 4'b1000; // subi
            7'bxx_01010: opOut = 4'b0101; // xori 
            7'bxx_01011: opOut = 4'b0110; // andni
            7'bxx_10100: opOut = 4'b0000; // roli 
            7'bxx_10101: opOut = 4'b0001; // slli
            7'bxx_10110: opOut = 4'b0010; // rori
            7'bxx_10111: opOut = 4'b0011; // srli
            7'bxx_10000: opOut = 4'b0100; // st
            7'bxx_10001: opOut = 4'b0100; // ld
            7'bxx_10011: opOut = 4'b0100; // stu
            // TODO: not sure what btr instruction does
            7'bxx_11001: opOut = 4'b0100; // btr
            7'b00_11011: opOut = 4'b0100; // add
            7'b01_11011: opOut = 4'b1000; // sub
            7'b10_11011: opOut = 4'b0101; // xor
            7'b11_11011: opOut = 4'b0110; // andn
            7'b00_11010: opOut = 4'b0000; // rol
            7'b01_11010: opOut = 4'b0001; // sll
            7'b10_11010: opOut = 4'b0010; // ror
            7'b11_11010: opOut = 4'b0011; // srl
            7'bxx_11100: opOut = 4'b0111; // seq
            7'bxx_11101: opOut = 4'b0111; // slt
            7'bxx_11110: opOut = 4'b0111; // sle
            7'bxx_11111: opOut = 4'b0100; // sco
            7'bxx_01100: opOut = 4'b0111; // beqz
            7'bxx_01101: opOut = 4'b0111; // bnez
            7'bxx_01110: opOut = 4'b0111; // bltz
            7'bxx_01111: opOut = 4'b0111; // bgez
            7'bxx_00101: opOut = 4'b0100; // jr
            default: opOut = 3'bxxx;
        endcase
    end
endmodule
