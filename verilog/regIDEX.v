module regIDEX(PC2_In, PC2_IDEX, Rd1_In, Rd1_IDEX, Rd2_In, Rd2_IDEX, Imm_In, Imm_IDEX,
            ALUOp_In, ALUOp_IDEX, ALUF_In, ALUF_IDEX, ALUSrc_In, ALUSrc_IDEX, Branch_In, 
            Branch_IDEX, Jump_In, Jump_IDEX, Dump_In, Dump_IDEX, MemtoReg_In, MemtoReg_IDEX, 
            MemWrite_In, MemWrite_IDEX, MemRead_In, MemRead_IDEX, clk, rst);

    input [15:0] PC2_In, Rd1_In, Rd2_In, Imm_In;
    output [15:0] PC2_IDEX, Rd1_IDEX, Rd2_IDEX, Imm_IDEX;

    input [4:0] ALUOp_In;
    output [4:0] ALUOp_IDEX;

    input [1:0] ALUF_In;
    output [1:0] ALUF_IDEX; 

    input ALUSrc_In, Branch_In, Jump_In, Dump_In, MemtoReg_In, MemWrite_In, MemRead_In;
    output ALUSrc_IDEX, Branch_IDEX, Jump_IDEX, Dump_IDEX, MemtoReg_IDEX, MemWrite_IDEX, MemRead_IDEX;

    reg16bit reg0(.clk(clk), .rst(rst), .en(1'b1), .in(PC2_In), .out(PC2_IDEX));
    reg16bit reg1(.clk(clk), .rst(rst), .en(1'b1), .in(Rd1_In), .out(Rd1_IDEX));
    reg16bit reg2(.clk(clk), .rst(rst), .en(1'b1), .in(Rd2_In), .out(Rd2_IDEX));
    reg16bit reg3(.clk(clk), .rst(rst), .en(1'b1), .in(Imm_In), .out(Imm_IDEX));

    reg5bit reg4(.clk(clk), .rst(rst), .en(1'b1), .in(ALUOp_In), .out(ALUOp_IDEX));

    reg2bit reg5(.clk(clk), .rst(rst), .en(1'b1), .in(ALUF_In), .out(ALUF_IDEX));

    dff_en reg7(.out(ALUSrc_In),.in(ALUSrc_IDEX),.en(1'b1),.clk(clk),.rst(rst));
    dff_en reg8(.out(Branch_In),.in(Branch_IDEX),.en(1'b1),.clk(clk),.rst(rst));
    dff_en reg9(.out(Jump_In),.in(Jump_IDEX),.en(1'b1),.clk(clk),.rst(rst));
    dff_en reg10(.out(Dump_In),.in(Dump_IDEX),.en(1'b1),.clk(clk),.rst(rst));
    dff_en reg11(.out(MemtoReg_In),.in(MemtoReg_IDEX),.en(1'b1),.clk(clk),.rst(rst));
    dff_en reg12(.out(MemWrite_In),.in(MemWrite_IDEX),.en(1'b1),.clk(clk),.rst(rst));
    dff_en reg13(.out(MemRead_In),.in(MemRead_IDEX),.en(1'b1),.clk(clk),.rst(rst));

endmodule
