module execute_stage(PC2, ALUSrc, ALUOp, Rd1, Rd2, Imm, ALUF, Branch,
            PCS, flag, ALUO, err);

    input [15:0] PC2, Rd1, Rd2, Imm;
    input [4:0] ALUOp;
    input [1:0] ALUF;
    input ALUSrc, Branch;

    output [15:0] PCS, ALUO;
    output [2:0] flag;
    output err;

    wire invB, immPass, doSLBI, takeBranch, CO, ofl, aluerr;
    wire [2:0] opOut;
    wire [15:0] outALU, outCLA;

    reg [15:0] bin;
    reg exerr;

    branchCtrl BRANCHCTRL(.Branch(Branch), .branchType(ALUOp[1:0]), .flag(flag), .takeBranch(takeBranch));
    carryLA_16b CLA(.A(PC2), .B(Imm), .SUM(outCLA), .CI(1'b0), .CO(CO), .Ofl(ofl));
    assign PCS = (takeBranch) ? outCLA : PC2;

    alu THEALU(.A(Rd1), .B(bin), .Op(opOut), .invA(1'b0), .invB(invB), .sign(1'b1), .Out(outALU), .Ofl(flag[1]), .Z(flag[0]), .err(aluerr));
    aluCtrl ALUCTRL(.ALUOp(ALUOp), .ALUF(ALUF), .opOut(opOut), .invB(invB), .immPass(immPass), .doSLBI(doSLBI));

    assign ALUO = (immPass) ? Imm : outALU;
    assign flag[2] = ALUO[15]; // neg flag is bit 2

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
            default: begin
                bin = 16'hxxxx;
                exerr = 1'b1;
            end
        endcase
    end

endmodule
