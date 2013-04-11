module execute(pc2, aluSrc, aluOp, rd1, rd2, imm, aluF, jump, branch,
            pcNext, flag, exOut, err);

    input [15:0] pc2, rd1, rd2, imm;
    input [4:0] aluOp;
    input [1:0] aluF;
    input aluSrc, branch, jump;

    output [15:0] pcNext, exOut;
    output [2:0] flag;
    output err;
<<<<<<< HEAD

    wire invB, immPass, doSLE, doSEQ, doSCO, doBTR, doSLBI, doSLT, takeBranch, CO, ofl, aluerr, dummy;
=======
    
    //Internal Control Wires
    wire invB, immPass, doSLE, doSEQ, doSCO, doBTR, doSTU, doSLBI, doSLT, takeBranch, CO, ofl, aluerr, dummy, dummy2;
>>>>>>> 22d92accdabc6edd4b2d3168dfe511ab1bdce9fb
    wire [3:0] opOut;
    wire [15:0] outALU,stuOut, temp, outCLA, sleOut, seqOut, scoOut, slbiOut, sltOut, btrOut, claIn, addA, addB, addSum;
    
<<<<<<< HEAD
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
=======
    //Internal Registers for output
    reg [15:0] bin, ALUO;
    reg exerr;
    
       //Adder for Immediates [Imm + (Rd1 or PC2)]
    carryLA_16b CLA(.A(claIn), .B(Imm), .SUM(outCLA), .CI(1'b0), .CO(dummy), .Ofl(ofl));
    assign claIn = ((ALUOp == 5'b00101) | (ALUOp == 5'b00111)) ? Rd1 : PC2;

    //Control logic for branch -- result is addr: PCS
     branchCtrl BRANCHCTRL(.Branch(Branch), .Jump(Jump), .branchType(ALUOp[1:0]), 
    .flag(flag), .takeBranch(takeBranch));
    assign PCS = (takeBranch) ? outCLA : PC2;

    //Specific function ALU logic
    //For sltOut and sleOut:neg-to-pos and pos-to-neg detection
    assign slbiOut = (Rd1 << 4'h8) | Imm;
    assign sltOut = (Rd2[15]&(~Rd1[15])) ? 16'h0000 : (((~Rd2[15])&Rd1[15]) ? 
                    16'h0001 : (flag[2] ? 16'h0001 : 16'h0000));
    assign btrOut = {Rd1[0],Rd1[1],Rd1[2],Rd1[3],Rd1[4],Rd1[5],Rd1[6],Rd1[7],Rd1[8],Rd1[9],
                    Rd1[10],Rd1[11],Rd1[12],Rd1[13],Rd1[14],Rd1[15]};
    assign scoOut = (CO) ? 16'h0001 : 16'h0000;
    assign seqOut = (flag[0]) ? 16'h0001 : 16'h0000;
    assign sleOut = (Rd1==Rd2) ? 16'h0001 : ((Rd2[15]&(~Rd1[15])) ? 16'h0000 : (((~Rd2[15])&Rd1[15]) ? 
                    16'h0001 : (flag[2] ? 16'h0001 : 16'h0000)));

    //Added for STU -- change to route through adder
    assign temp = Imm + Rd1;
    assign stuOut = temp;
    //Overflow correction

    //Alu for add, subtract and shifts
     alu THEALU(.A(Rd1), .B(bin), .Op(opOut), .invA(1'b0), .invB(invB), .sign(1'b1), 
>>>>>>> 22d92accdabc6edd4b2d3168dfe511ab1bdce9fb
        .Out(outALU), .Ofl(flag[1]), .Z(flag[0]), .CO(CO), .err(aluerr));
    aluCtrl ALUCTRL(.aluOp(aluOp), .aluF(aluF), .opOut(opOut), .invB(invB), 
        .immPass(immPass), .doSLE(doSLE), .doSEQ(doSEQ), .doSCO(doSCO), .doBTR(doBTR), 
        .doSLBI(doSLBI), .doSLT(doSLT),.doSTU(doSTU));

    always @(*) begin
<<<<<<< HEAD
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
=======
        casex ({doSTU,doSLE, doSEQ, doSCO, Jump, doBTR, doSLT, immPass, doSLBI})
            9'b000000000: ALUO = outALU;
            9'b000000001: ALUO = slbiOut;
            9'b000000010: ALUO = Imm;
            9'b000000100: ALUO = sltOut;
            9'b000001000: ALUO = btrOut;
            9'b000010000: ALUO = PC2;
            9'b000100000: ALUO = scoOut;
            9'b001000000: ALUO = seqOut;
            9'b010000000: ALUO = sleOut;
            9'b100000000: ALUO = stuOut;
            default: ALUO = 16'hxxxx;
>>>>>>> 22d92accdabc6edd4b2d3168dfe511ab1bdce9fb
        endcase
    end

    assign flag[2] = outALU[15]; // negative flag = flag[2]
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
