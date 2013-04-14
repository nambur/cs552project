//NEW MEMORY MODULE
//John Vennard and Nick Ambur
module memory(Imm_EXMEM,ALUO_EXMEM,Rd2_EXMEM,
              Branch_EXMEM,MemtoReg_EXMEM,MemWrite_EXMEM,
              MemRead_EXMEM,Dump_EXMEM,RdD_MEMWB,MemtoReg_EXMEM,MemtoReg_MEMWB,
              clk,rst);
    //Non-Pipelined in/out
    input clk,rst;
    //Input
    input [15:0] Imm_EXMEM, ALUO_EXMEM,Rd2_EXMEM;
    input Branch_EXMEM,MemtoReg_EXMEM,MemWrite_EXMEM
    ,MemRead_EXMEM,Dump_EXMEM;
    //output
    output [15:0] RdD_MEMWB;
    output MemtoReg_MEMWB;

    //internal wire
    wire memReadorWrite;
    wire [15:0] RdD;

    //Pipeline Register 
    reg16bit reg0(.clk(clk),.rst(rst),.en(1'b1),.in(RdD),.out(RdD_MEMWB));
    dff_en reg1(.clk(clk),.rst(rst),.en(1'b1),.in(MemtoReg_EXMEM),.out(MemtoReg_MEMWB));

    //enable logic  
    assign memReadorWrite = (MemWrite_EXMEM | MemRead_EXMEM);

    //Instantiate GIVEN MEMORY BLOCK --- NO CHANGES
    memory2c mem(.data_out(RdD),.data_in(Rd2_EXMEM),
    .addr(ALUO_EXMEM), .enable(memReadorWrite), .wr(MemWrite_EXMEM),
    .createdump(Dump_EXMEM), 
    .clk(clk), .rst(rst));

endmodule
 
