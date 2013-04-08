module execute(PC2, ALUSrc, ALUOp, Rd1, Rd2, Imm, ALUF, Jump, Branch,
            PCS, flag, ALUO, err);

    input [15:0] PC2, Rd1, Rd2, Imm;
    input [4:0] ALUOp;
    input [1:0] ALUF;
    input ALUSrc, Branch, Jump;

    output [15:0] PCS, ALUO;
    output [2:0] flag;
    output err;
    
    //Internal Control Wires
    wire invB, immPass, doSLE, doSEQ, doSCO, doBTR, doSTU, doSLBI, doSLT, takeBranch, CO, ofl, aluerr, dummy, dummy2;
    wire [3:0] opOut;
    wire [15:0] outALU,stuOut, temp, outCLA, sleOut, seqOut, scoOut, slbiOut, sltOut, btrOut, claIn, addA, addB, addSum;
    
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
        .Out(outALU), .Ofl(flag[1]), .Z(flag[0]), .CO(CO), .err(aluerr));
    aluCtrl ALUCTRL(.ALUOp(ALUOp), .ALUF(ALUF), .opOut(opOut), .invB(invB), 
        .immPass(immPass), .doSLE(doSLE), .doSEQ(doSEQ), .doSCO(doSCO), .doBTR(doBTR), 
        .doSLBI(doSLBI), .doSLT(doSLT),.doSTU(doSTU));

    always @(*) begin
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
        endcase
    end

    assign flag[2] = outALU[15]; // negative flag = flag[2]
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
