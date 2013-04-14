//NEW MEMORY MODULE
//John Vennard and Nick Ambur
module memory(Imm_EXMEM,ALUO_EXMEM,Rd2_EXMEM,
              takeBranch_EXMEM,MemWrite_EXMEM,RegWrite_EXMEM,RegWrite_MEMWB,
              MemRead_EXMEM,Dump_EXMEM,RdD_MEMWB,MemtoReg_EXMEM,MemtoReg_MEMWB,
              WrR_EXMEM, WrR_MEMWB, clk,rst);

    //Non-Pipelined in/out
    input clk,rst;

    //Input
    input [15:0] Imm_EXMEM, ALUO_EXMEM,Rd2_EXMEM;
    input takeBranch_EXMEM,MemtoReg_EXMEM,MemWrite_EXMEM, RegWrite_EXMEM
        ,MemRead_EXMEM,Dump_EXMEM;
    input [2:0] WrR_EXMEM;

    //output
    output [15:0] RdD_MEMWB;
    output MemtoReg_MEMWB, RegWrite_MEMWB;
    output [2:0] WrR_MEMWB;

    //internal wire
    wire memReadorWrite;
    wire [15:0] RdD;

    //stall mux
    assign RegWrIn = (takeBranch_EXMEM) ? 1'b0 : RegWrite_EXMEM;
    assign MemWrIn = (takeBranch_EXMEM) ? 1'b0 : MemWrite_EXMEM;

    //Pipeline Register 
    reg16bit reg0(.clk(clk),.rst(rst),.en(1'b1),.in(RdD),.out(RdD_MEMWB));
    dff_en reg1(.clk(clk),.rst(rst),.en(1'b1),.in(MemtoReg_EXMEM),.out(MemtoReg_MEMWB));
    dff_en reg2(.clk(clk),.rst(rst),.en(1'b1),.in(RegWrIn),.out(RegWrite_MEMWB));
    reg3bit reg3(.clk(clk),.rst(rst),.en(1'b1),.in(WrR_EXMEM),.out(WrR_MEMWB));

    //enable logic  
    assign memReadorWrite = (MemWrIn | MemRead_EXMEM);

    //Instantiate GIVEN MEMORY BLOCK --- NO CHANGES
    memory2c mem(.data_out(RdD),.data_in(Rd2_EXMEM),
    .addr(ALUO_EXMEM), .enable(memReadorWrite), .wr(MemWrIn),
    .createdump(Dump_EXMEM), 
    .clk(clk), .rst(rst));

endmodule
 
