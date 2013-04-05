module execute(pc2, aluSrc, aluOp, rd1, rd2, imm, aluF, jump, branch,
            pcNext, flag, exOut, err);

    input [15:0] pc2, rd1, rd2, imm;
    input [4:0] aluOp;
    input [1:0] aluF;
    input aluSrc, branch, jump;

    output [15:0] pcNext, exOut;
    output [2:0] flag;
    output err;

    wire invB, immPass, doSLE, doSEQ, doSCO, doBTR, doSLBI, doSLT, takeBranch, CO, ofl, aluerr, dummy;
    wire [3:0] opOut;
    wire [15:0] outALU, outCLA, sleOut, seqOut, scoOut, slbiOut, sltOut, btrOut, claIn, addA, addB, addSum;
    
    reg [15:0] bin, exOut;
    reg exerr;

    branchCtrl BRANCHCTRL(.branch(branch), .jump(jump), .branchType(aluOp[1:0]), .flag(flag), .takeBranch(takeBranch));
    carryLA_16b CLA(.A(claIn), .B(imm), .SUM(outCLA), .CI(1'b0), .CO(dummy), .Ofl(ofl));
    assign pcNext = (takeBranch) ? outCLA : pc2;
    assign claIn = ((aluOp == 5'b00101) | (aluOp == 5'b00111)) ? rd1 : pc2;

    assign slbiOut = (rd1 << 4'h8) | imm;
    assign sltOut = (flag[2]) ? 16'h0001 : 16'h0000;
    assign btrOut = {rd1[0],rd1[1],rd1[2],rd1[3],rd1[4],rd1[5],rd1[6],rd1[7],rd1[8],rd1[9],
                    rd1[10],rd1[11],rd1[12],rd1[13],rd1[14],rd1[15]};
    assign scoOut = (CO) ? 16'h0001 : 16'h0000;
    assign seqOut = (flag[0]) ? 16'h0001 : 16'h0000;
    assign sleOut = (flag[2] | flag[0]) ? 16'b0001 : 16'b0000;
    
    alu THEALU(.A(rd1), .B(bin), .Op(opOut), .invA(1'b0), .invB(invB), .sign(1'b1), 
        .Out(outALU), .Ofl(flag[1]), .Z(flag[0]), .CO(CO), .err(aluerr));
    aluCtrl ALUCTRL(.aluOp(aluOp), .aluF(aluF), .opOut(opOut), .invB(invB), 
        .immPass(immPass), .doSLE(doSLE), .doSEQ(doSEQ), .doSCO(doSCO), .doBTR(doBTR), 
        .doSLBI(doSLBI), .doSLT(doSLT));

    always @(*) begin
        casex ({doSLE, doSEQ, doSCO, jump, doBTR, doSLT, immPass, doSLBI})
            8'b00000000: exOut = outALU;
            8'b00000001: exOut = slbiOut;
            8'b00000010: exOut = imm;
            8'b00000100: exOut = sltOut;
            8'b00001000: exOut = btrOut;
            8'b00010000: exOut = pc2;
            8'b00100000: exOut = scoOut;
            8'b01000000: exOut = seqOut;
            8'b10000000: exOut = sleOut;
            default: exOut = 16'hxxxx;
        endcase
    end

    assign flag[2] = outALU[15]; // neg flag is bit 2

    assign err = aluerr | exerr;

    // mux leading into B input of the ALU
    always @(*) begin
        casex({branch, aluSrc})
            2'b00: begin
                bin = rd2;
                exerr = 1'b0;
            end
            2'b01: begin
                bin = imm;
                exerr = 1'b0;
            end
            2'b1x: begin
                bin = 16'h0000;
                exerr = 1'b0;
            end
        endcase
    end

endmodule
