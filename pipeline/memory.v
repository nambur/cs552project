//NEW MEMORY MODULE
//John Vennard and Nick Ambur
module memory(ALUO_EXMEM,ALUO_MEMWB,Rd2_EXMEM,takeBranch,
              takeBranch_EXMEM,MemWrite_EXMEM,RegWrite_EXMEM,RegWrite_MEMWB,
              MemRead_EXMEM,Dump_EXMEM,RdD_MEMWB,MemtoReg_EXMEM,MemtoReg_MEMWB,
              WrR_EXMEM, WrR_MEMWB, clk,rst,halt_EXMEM,halt_MEMWB, jumpAndLink_EXMEM);

    //Non-Pipelined in/out
    input clk,rst,halt_EXMEM;

    //Input
    input [15:0] ALUO_EXMEM,Rd2_EXMEM;
    input takeBranch,takeBranch_EXMEM,MemtoReg_EXMEM,MemWrite_EXMEM, RegWrite_EXMEM
        ,MemRead_EXMEM,Dump_EXMEM,jumpAndLink_EXMEM;
    input [2:0] WrR_EXMEM;

    //output
    output [15:0] RdD_MEMWB,ALUO_MEMWB;
    output MemtoReg_MEMWB, RegWrite_MEMWB,halt_MEMWB;
    output [2:0] WrR_MEMWB;

    //internal wire
    wire memReadorWrite,MemReadIn,haltTemp;
    wire [15:0] RdD;
   
    //stall mux
    assign RegWrIn = (jumpAndLink_EXMEM & RegWrite_EXMEM) ? 1'b1 :
    ((takeBranch_EXMEM) ? 1'b0 : RegWrite_EXMEM);
    assign MemWrIn = (takeBranch_EXMEM | halt_EXMEM) ? 1'b0 : MemWrite_EXMEM;
    assign MemReadIn = (takeBranch_EXMEM) ? 1'b0 : MemRead_EXMEM;

    //TODO modified Fri 19 Apr 2013 09:07:23 PM CDT
    assign haltTemp = (takeBranch_EXMEM) ? 1'b0 : halt_EXMEM;
    //assign haltTemp = halt_EXMEM;

    //Pipeline Register 
    reg16bit reg0(.clk(clk),.rst(rst),.en(1'b1),.in(RdD),.out(RdD_MEMWB));
    dff_en reg1(.clk(clk),.rst(rst),.en(1'b1),.in(MemtoReg_EXMEM),.out(MemtoReg_MEMWB));
    dff_en reg2(.clk(clk),.rst(rst),.en(1'b1),.in(RegWrIn),.out(RegWrite_MEMWB));
    reg3bit reg3(.clk(clk),.rst(rst),.en(1'b1),.in(WrR_EXMEM),.out(WrR_MEMWB));
    reg16bit reg4(.clk(clk),.rst(rst),.en(1'b1),.in(ALUO_EXMEM),.out(ALUO_MEMWB));
    dff_en reg5(.clk(clk),.rst(rst),.en(1'b1),.in(haltTemp),.out(halt_MEMWB));

    //enable logic  
    assign memReadorWrite = (MemWrIn | MemReadIn);

    //Instantiate GIVEN MEMORY BLOCK --- NO CHANGES
    memory2c mem(.data_out(RdD),.data_in(Rd2_EXMEM),
    .addr(ALUO_EXMEM), .enable(memReadorWrite), .wr(MemWrIn),
    .createdump(Dump_EXMEM), 
    .clk(clk), .rst(rst));

endmodule
