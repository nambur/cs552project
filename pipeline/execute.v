module execute(ALUSrc_IDEX,PC2_IDEX,ALUOp_IDEX,Rd1_IDEX,Rd2_IDEX,Imm_IDEX,ALUF_IDEX,
              Branch_IDEX,takeBranch,takeBranch_EXMEM,Dump_IDEX, WrR_IDEX, WrR_EXMEM, RegWrite_IDEX, RegWrite_EXMEM,
              MemtoReg_IDEX,MemWrite_IDEX,MemRead_IDEX,PCS_EXMEM,jumpAndLink_IDEX,jumpAndLink_EXMEM,
              ALUO_EXMEM,Rd2_EXMEM,MemtoReg_EXMEM,MemWrite_EXMEM,PC_IDEX,
              MemRead_EXMEM,Dump_EXMEM,halt_IDEX,halt_EXMEM,Jump_IDEX
              ,err,clk,rst);
    //Non-Pipelined signals 
    output err;
    input clk,rst;

    //input
    input [15:0] PC2_IDEX,PC_IDEX,Rd1_IDEX,Rd2_IDEX,Imm_IDEX;
    input [4:0] ALUOp_IDEX;
    input [1:0] ALUF_IDEX;
    input ALUSrc_IDEX,Branch_IDEX,Dump_IDEX,MemtoReg_IDEX,jumpAndLink_IDEX,
        MemWrite_IDEX,MemRead_IDEX, RegWrite_IDEX,halt_IDEX,Jump_IDEX;
    input [2:0] WrR_IDEX;

    //output
    output [15:0] PCS_EXMEM, ALUO_EXMEM,Rd2_EXMEM;
    output [2:0] WrR_EXMEM;
    output MemtoReg_EXMEM,MemWrite_EXMEM,MemRead_EXMEM,RegWrite_EXMEM;
    output Dump_EXMEM,takeBranch_EXMEM,halt_EXMEM,jumpAndLink_EXMEM,takeBranch;

    //Internal Signals
    wire haltTemp;
    wire invB, immPass, doSLE, doSEQ, doSCO, doBTR, doSTU, RegWrIn, MemWrIn,
        doSLBI, doSLT, CO, ofl, aluerr, dummy, dummy2,MemReadIn;
    wire [3:0] opOut;
    wire [2:0] flag;
    wire [15:0] PCS,outALU,stuOut, temp, outCLA, sleOut, seqOut,
        scoOut, slbiOut, sltOut, btrOut, claIn;
    reg [15:0] bin,ALUO;
    reg exerr;

    //flush mux
    assign RegWrIn = (takeBranch_EXMEM) ? 1'b0 : RegWrite_IDEX;
    assign MemWrIn = (takeBranch_EXMEM) ? 1'b0 : MemWrite_IDEX;
    assign MemReadIn = (takeBranch_EXMEM) ? 1'b0 : MemRead_IDEX;
    assign haltTemp = (takeBranch_EXMEM) ? 1'b0 : halt_IDEX;

    //Pipeline Registers
    reg16bit reg2(.clk(clk),.rst(rst),.en(1'b1),.in(PCS),.out(PCS_EXMEM));
    reg16bit reg0(.clk(clk),.rst(rst),.en(1'b1),.in(Rd2_IDEX),.out(Rd2_EXMEM));
    reg16bit reg3(.clk(clk),.rst(rst),.en(1'b1),.in(ALUO),.out(ALUO_EXMEM));
    reg5bit reg4(.clk(clk),.rst(rst),.en(1'b1),.in({takeBranch,MemtoReg_IDEX
                                                    ,MemWrIn,MemReadIn
                                                    ,Dump_IDEX}),
                                               .out({takeBranch_EXMEM
                                                    ,MemtoReg_EXMEM,MemWrite_EXMEM
                                                    ,MemRead_EXMEM,Dump_EXMEM}));

    dff_en reg5(.in(RegWrIn),.out(RegWrite_EXMEM),.en(1'b1),.clk(clk),.rst(rst));
    reg3bit reg6(.clk(clk),.rst(rst),.en(1'b1),.in(WrR_IDEX),.out(WrR_EXMEM));
    dff_en reg7(.in(haltTemp),.out(halt_EXMEM),.en(1'b1),.clk(clk),.rst(rst));
    dff_en reg8(.in(jumpAndLink_IDEX),.out(jumpAndLink_EXMEM),.en(1'b1),.clk(clk),.rst(rst));
   
    branchCtrl BRANCHCTRL(.Jump_IDEX(Jump_IDEX),.Branch(Branch_IDEX), .branchType(ALUOp_IDEX[1:0]),
    .flag(flag), .takeBranch(takeBranch));
    carryLA_16b CLA(.A(claIn), .B(Imm_IDEX), .SUM(outCLA), .CI(1'b0), .CO(dummy), .Ofl(ofl));
    assign PCS = (Branch_IDEX | Jump_IDEX) ? outCLA : PC_IDEX;
    assign claIn = ((ALUOp_IDEX == 5'b00101) | (ALUOp_IDEX == 5'b00111)) ? Rd1_IDEX : PC_IDEX;

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
    aluCtrl ALUCTRL(.ALUOp(ALUOp_IDEX), .ALUF(ALUF_IDEX), .opOut(opOut), .invB(invB), 
        .immPass(immPass), .doSLE(doSLE), .doSEQ(doSEQ), .doSCO(doSCO), .doBTR(doBTR), 
        .doSLBI(doSLBI), .doSLT(doSLT),.doSTU(doSTU));

    always @(*) begin
        casex ({Jump_IDEX,doSTU,doSLE, doSEQ, doSCO, doBTR, doSLT, immPass, doSLBI})
            9'b000000000: ALUO = outALU;
            9'b000000001: ALUO = slbiOut;
            9'b000000010: ALUO = Imm_IDEX;
            9'b000000100: ALUO = sltOut;
            9'b000001000: ALUO = btrOut;
            9'b000010000: ALUO = scoOut;
            9'b000100000: ALUO = seqOut;
            9'b001000000: ALUO = sleOut;
            9'b010000000: ALUO = stuOut;
            9'b100000000: ALUO = PC_IDEX;
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
