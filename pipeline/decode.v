//John Vennard & Nick Ambur
//552 Project Decode Module
module decode(instr_IFID,PC2_IFID,size, zeroEx, WrR_MEMWB, writeData,RegDst,RegWrite
			,RegWrite_MEMWB,clk,rst,err,PC2_IDEX,Rd1_IDEX,Rd2_IDEX,Imm_IDEX,ALUOp_IDEX
            ,RegDst_IDEX,ALUF_IDEX,ALUSrc_IDEX,Branch_IDEX,RegWrite_IDEX
            ,Dump_IDEX,MemtoReg_IDEX,MemWrite_IDEX,MemRead_IDEX
            ,ALUOp,ALUF,ALUSrc,Branch,Dump,MemtoReg,MemWrite,MemRead
            ,Rd2Addr_IDEX,WrR_IDEX,stallCtrl,takeBranch_EXMEM,halt_IFID,halt_IDEX);
//Inputs
input [15:0] instr_IFID,writeData,PC2_IFID;
input [1:0] RegDst,size;
input RegWrite, RegWrite_MEMWB, zeroEx, clk,rst,stallCtrl,takeBranch_EXMEM;
input [4:0] ALUOp;
input [2:0] WrR_MEMWB;
input [1:0] ALUF;
input ALUSrc,halt_IFID,Branch,Dump,MemtoReg,MemWrite,MemRead;
//Output
output err;
/*
 * Signals to Pipeline
 */
output [2:0] Rd2Addr_IDEX,WrR_IDEX;
output [15:0] PC2_IDEX,Rd1_IDEX,Rd2_IDEX,Imm_IDEX;
output [4:0] ALUOp_IDEX;
output [1:0] RegDst_IDEX,ALUF_IDEX;
output ALUSrc_IDEX,Branch_IDEX,Dump_IDEX,MemtoReg_IDEX,MemWrite_IDEX,
    MemRead_IDEX,RegWrite_IDEX,halt_IDEX;
//Internal Wires
reg [2:0] WrR;	//Holds address of register to write to
wire RegWrIn,MemWrIn,MemReadIn;
reg [15:0] Imm;
wire [15:0] Rd1, Rd2;

//stall mux
assign RegWrIn = (stallCtrl | takeBranch_EXMEM) ? 1'b0 : RegWrite;
assign MemWrIn = (stallCtrl | takeBranch_EXMEM) ? 1'b0 : MemWrite;
assign MemReadIn = (stallCtrl | takeBranch_EXMEM) ? 1'b0 : MemRead;

//PC2,Rd1,Rd2,Imm,+control sigs
reg16bit reg0(.clk(clk),.rst(rst),.en(1'b1),.in(PC2_IFID),.out(PC2_IDEX));
reg16bit reg1(.clk(clk),.rst(rst),.en(1'b1),.in(Rd1),.out(Rd1_IDEX));
reg16bit reg2(.clk(clk),.rst(rst),.en(1'b1),.in(Rd2),.out(Rd2_IDEX));
reg16bit reg3(.clk(clk),.rst(rst),.en(1'b1),.in(Imm),.out(Imm_IDEX));
//Control signals -- through a 16bit reg
reg15bit reg4(.clk(clk),.rst(rst),.en(1'b1),.in({ALUOp,RegDst,ALUF,ALUSrc
                                                ,Branch,Dump,MemtoReg
                                                ,MemWrIn,MemReadIn}),
                                            .out({ALUOp_IDEX,RegDst_IDEX
                                                ,ALUF_IDEX,ALUSrc_IDEX,Branch_IDEX
                                                ,Dump_IDEX,MemtoReg_IDEX
                                                ,MemWrite_IDEX,MemRead_IDEX}));

reg7bit reg5(.clk(clk),.rst(rst),.en(1'b1),.in({instr_IFID[7:5],WrR,RegWrIn}),
        .out({Rd2Addr_IDEX,WrR_IDEX,RegWrite_IDEX}));
dff_en reg6(.out(halt_IDEX),.in(halt_IFID),.en(1'b1),.clk(clk),.rst(rst));

always @(*) begin
    casex({zeroEx,size})
        3'b000: Imm = {{11{instr_IFID[4]}},instr_IFID[4:0]};
        3'b001: Imm = {{8{instr_IFID[7]}},instr_IFID[7:0]};
        3'b010: Imm = {{5{instr_IFID[10]}},instr_IFID[10:0]};
        3'b100: Imm = {11'b000,instr_IFID[4:0]};
        3'b101: Imm = {8'h00,instr_IFID[7:0]};
        3'b110: Imm = {5'h00,instr_IFID[10:0]};
        default: Imm = 16'hxxxx;
    endcase
end


//added for bypassing
wire [15:0] out1data,out2data;
wire mux1sel,mux2sel;

//Write register logic
//RegDst - WrR
//00 - Inst[7:5] -- Rd for I-format 1 
//01 - Inst[4:2] -- Rd for R-format
//10 - Inst[10:8] -- Rs for I-format 2
//11 - R7
always @(*) begin
    casex(RegDst)
        2'b00: WrR = instr_IFID[7:5];
        2'b01: WrR = instr_IFID[4:2];
        2'b10: WrR = instr_IFID[10:8];
        2'b11: WrR = 3'b111;
    endcase
end

//Instantiate register file with bypassing
//8 16bit registers 
rf regFile0(.read1data(out1data),.read2data(out2data),.err(err)//Outputs
		
		,.clk(clk),.rst(rst)			//Inputs
		,.read1regsel(instr_IFID[10:8]),.read2regsel(instr_IFID[7:5])	
		,.writeregsel(WrR_MEMWB),.writedata(writeData),.write(RegWrite_MEMWB));

//ADDED BYPASS LOGIC
//assign mux1sel = (RegWrite&(WrR==Instr[10:8])) ;
//assign mux2sel = (RegWrite&(WrR==Instr[7:5])) ;
assign Rd1 = out1data;
assign Rd2 = out2data;
//always @(posedge clk or posedge rst) begin
//if(mux1sel) Rd1 <= writeData;
//else Rd1 <= out1data;
//end
//always @(posedge clk or posedge rst) begin
//if(mux2sel) Rd2 <= writeData;
//else Rd2 <= out2data;
//end
endmodule
