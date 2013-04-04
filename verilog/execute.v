module execute(PC2, ALUSrc, ALUOp, Rd1, Rd2, Imm, ALUF, Jump, Branch,
            PCS, flag, ALUO, err);

    input [15:0] PC2, Rd1, Rd2, Imm;
    input [4:0] ALUOp;
    input [1:0] ALUF;
    input ALUSrc, Branch, Jump;

    output [15:0] PCS, ALUO;
    output [2:0] flag;
    output err;

    wire invB, immPass, doSLE, doSEQ, doSCO, doBTR, doSLBI, doSLT, takeBranch, CO, ofl, aluerr, dummy, dummy2;
    wire [3:0] opOut;
    wire [15:0] outALU, outCLA, sleOut, seqOut, scoOut, slbiOut, sltOut, btrOut, claIn, addA, addB, addSum;
    
    reg [15:0] bin, ALUO;
    reg exerr;

    branchCtrl BRANCHCTRL(.Branch(Branch), .Jump(Jump), .branchType(ALUOp[1:0]), .flag(flag), .takeBranch(takeBranch));
    carryLA_16b CLA(.A(claIn), .B(Imm), .SUM(outCLA), .CI(1'b0), .CO(dummy), .Ofl(ofl));
    assign PCS = (takeBranch) ? outCLA : PC2;
    assign claIn = ((ALUOp == 5'b00101) | (ALUOp == 5'b00111)) ? Rd1 : PC2;

    assign slbiOut = (Rd1 << 4'h8) | Imm;
    assign sltOut = (flag[2]) ? 16'h0001 : 16'h0000;
    assign btrOut = {Rd1[0],Rd1[1],Rd1[2],Rd1[3],Rd1[4],Rd1[5],Rd1[6],Rd1[7],Rd1[8],Rd1[9],
                    Rd1[10],Rd1[11],Rd1[12],Rd1[13],Rd1[14],Rd1[15]};
    assign scoOut = (CO) ? 16'h0001 : 16'h0000;
    assign seqOut = (flag[0]) ? 16'h0001 : 16'h0000;
    assign sleOut = (flag[2] | flag[0]) ? 16'b0001 : 16'b0000;
    
    alu THEALU(.A(Rd1), .B(bin), .Op(opOut), .invA(1'b0), .invB(invB), .sign(1'b1), 
        .Out(outALU), .Ofl(flag[1]), .Z(flag[0]), .CO(CO), .err(aluerr));
    aluCtrl ALUCTRL(.ALUOp(ALUOp), .ALUF(ALUF), .opOut(opOut), .invB(invB), 
        .immPass(immPass), .doSLE(doSLE), .doSEQ(doSEQ), .doSCO(doSCO), .doBTR(doBTR), 
        .doSLBI(doSLBI), .doSLT(doSLT));

    always @(*) begin
        casex ({doSLE, doSEQ, doSCO, Jump, doBTR, doSLT, immPass, doSLBI})
            8'b00000000: ALUO = outALU;
            8'b00000001: ALUO = slbiOut;
            8'b00000010: ALUO = Imm;
            8'b00000100: ALUO = sltOut;
            8'b00001000: ALUO = btrOut;
            8'b00010000: ALUO = PC2;
            8'b00100000: ALUO = scoOut;
            8'b01000000: ALUO = seqOut;
            8'b10000000: ALUO = sleOut;
            default: ALUO = 16'hxxxx;
        endcase
    end

    assign flag[2] = outALU[15]; // neg flag is bit 2

    assign err = aluerr | exerr;

    // mux leading into B input of the ALU
    always @(*) begin
        casex({Branch, ALUSrc})
            2'b00: begin
                bin = Rd2;
                exerr = 1'b0;
            end
            2'b01: begin
                bin = Imm;
                exerr = 1'b0;
            end
            2'b1x: begin
                bin = 16'h0000;
                exerr = 1'b0;
            end
        endcase
    end

endmodule
