module execute(ALUSrc_IDEX,PC2_IDEX,ALUOp_IDEX,Rd1_IDEX,Rd2_IDEX,Imm_IDEX,ALUF_IDEX,
              Jump_IDEX,Branch_IDEX,RegDst_IDEX,Dump_IDEX,
              MemtoReg_IDEX,MemWrite_IDEX,MemRead_IDEX,PCS_EXMEM,Imm_EXMEM,
              ALUO_EXMEM,Rd2_EXMEM,Branch_EXMEM,MemtoReg_EXMEM,MemWrite_EXMEM,
              MemRead_EXMEM,Dump_EXMEM,flag,err,clk,rst);
    //Non-Pipelined signals 
    output err;
    input clk,rst;

    //input
    input [15:0] PC2_IDEX,Rd1_IDEX,Rd2_IDEX,Imm_IDEX;
    input [4:0] ALUOp_IDEX;
    input [1:0] RegDst_IDEX,ALUF_IDEX;
    input ALUSrc_IDEX,Branch_IDEX,Jump_IDEX
      ,Dump_IDEX,MemtoReg_IDEX,MemWrite_IDEX,MemRead_IDEX;

    //output
    output [15:0] PCS_EXMEM, Imm_EXMEM, ALUO_EXMEM,Rd2_EXMEM;
    output [2:0] flag;
    output Branch_EXMEM,MemtoReg_EXMEM,MemWrite_EXMEM,MemRead_EXMEM;
    output Dump_EXMEM;

    //Internal Signals
    wire invB, immPass, doSLE, doSEQ, doSCO, doBTR, doSTU,
    doSLBI, doSLT, takeBranch, CO, ofl, aluerr, dummy, dummy2;
    wire [3:0] opOut;
    wire [15:0] PCS,outALU,stuOut, temp, outCLA, sleOut, seqOut,
    scoOut, slbiOut, sltOut, btrOut, claIn, addA, addB, addSum;
    reg [15:0] bin,ALUO;
    reg exerr;

    //Pipeline Registers
    reg16bit reg0(.clk(clk),.rst(rst),.en(1'b1),.in(Rd2_IDEX),.out(Rd2_EXMEM));
    reg16bit reg1(.clk(clk),.rst(rst),.en(1'b1),.in(PCS),.out(PCS_EXMEM));
    reg16bit reg2(.clk(clk),.rst(rst),.en(1'b1),.in(Imm_IDEX),.out(Imm_EXMEM));
    reg16bit reg3(.clk(clk),.rst(rst),.en(1'b1),.in(ALUO),.out(ALUO_EXMEM));
    reg16bit reg4(.clk(clk),.rst(rst),.en(1'b1),.in({Branch_IDEX,MemtoReg_IDEX
                                                    ,MemWrite_IDEX,MemRead_IDEX
                                                    ,Dump_IDEX}),.out({Branch_EXMEM
                                                    ,MemtoReg_EXMEM,MemWrite_EXMEM
                                                    ,MemRead_EXMEM,Dump_EXMEM}));

    branchCtrl BRANCHCTRL(.Branch(Branch_IDEX), .Jump(Jump_IDEX),.branchType(ALUOp_IDEX[1:0]), .flag(flag), .takeBranch(takeBranch));
    carryLA_16b CLA(.A(claIn), .B(Imm_IDEX), .SUM(outCLA), .CI(1'b0), .CO(dummy), .Ofl(ofl));
    assign PCS = (takeBranch) ? outCLA : PC2_IDEX;
    assign claIn = ((ALUOp_IDEX == 5'b00101) | (ALUOp_IDEX == 5'b00111)) ? Rd1_IDEX : PC2_IDEX;


    assign slbiOut = (Rd1_IDEX << 4'h8) | Imm_IDEX;
    //neg-to-pos and pos-to-neg detection
    assign sltOut = (Rd2_IDEX[15]&(~Rd1_IDEX[15])) ? 16'h0000 : (((~Rd2_IDEX[15])&Rd1_IDEX[15]) ? 
                    16'h0001 : (flag[2] ? 16'h0001 : 16'h0000));
    //assign sltOut = (flag[2]) ? 16'h0001 : 16'h0000;
    assign btrOut = {Rd1_IDEX[0],Rd1_IDEX[1],Rd1_IDEX[2],Rd1_IDEX[3],Rd1_IDEX[4],Rd1_IDEX[5],Rd1_IDEX[6],Rd1_IDEX[7],Rd1_IDEX[8],Rd1_IDEX[9],
                    Rd1_IDEX[10],Rd1_IDEX[11],Rd1_IDEX[12],Rd1_IDEX[13],Rd1_IDEX[14],Rd1_IDEX[15]};
    assign scoOut = (CO) ? 16'h0001 : 16'h0000;
    assign seqOut = (flag[0]) ? 16'h0001 : 16'h0000;
    assign sleOut = (Rd1_IDEX==Rd2_IDEX) ? 16'h0001 : ((Rd2_IDEX[15]&(~Rd1_IDEX[15])) ? 16'h0000 : (((~Rd2_IDEX[15])&Rd1_IDEX[15]) ? 
                    16'h0001 : (flag[2] ? 16'h0001 : 16'h0000)));

    //Added for STU -- change to route through adder
    assign temp = Imm_IDEX + Rd1_IDEX;
    assign stuOut = temp;

     alu THEALU(.A(Rd1_IDEX), .B(bin), .Op(opOut), .invA(1'b0), .invB(invB), .sign(1'b1), 
        .Out(outALU), .Ofl(flag[1]), .Z(flag[0]), .CO(CO), .err(aluerr));
    aluCtrl ALUCTRL(.ALUOp(ALUOp_IDEX), .ALUF(ALUF), .opOut(opOut), .invB(invB), 
        .immPass(immPass), .doSLE(doSLE), .doSEQ(doSEQ), .doSCO(doSCO), .doBTR(doBTR), 
        .doSLBI(doSLBI), .doSLT(doSLT),.doSTU(doSTU));

    always @(*) begin
        casex ({doSTU,doSLE, doSEQ, doSCO, Jump_IDEX, doBTR, doSLT, immPass, doSLBI})
            9'b000000000: ALUO = outALU;
            9'b000000001: ALUO = slbiOut;
            9'b000000010: ALUO = Imm_IDEX;
            9'b000000100: ALUO = sltOut;
            9'b000001000: ALUO = btrOut;
            9'b000010000: ALUO = PC2_IDEX;
            9'b000100000: ALUO = scoOut;
            9'b001000000: ALUO = seqOut;
            9'b010000000: ALUO = sleOut;
            9'b100000000: ALUO = stuOut;
            default: ALUO = 16'hxxxx;
        endcase
    end

    assign flag[2] = outALU[15]; // neg flag is bit 2

    assign err = aluerr | exerr;

    // mux leading into B input of the ALU
    always @(*) begin
        casex({Branch_IDEX, ALUSrc_IDEX})
            2'b00: begin
                bin = Rd2_IDEX;
                exerr = 1'b0;
            end
            2'b01: begin
                bin = Imm_IDEX;
                exerr = 1'b0;
            end
            2'b1x: begin
                bin = 16'h0000;
                exerr = 1'b0;
            end
        endcase
    end

endmodule
