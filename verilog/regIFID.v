module regIFID(instr_In, instr_IFID, PC2_In, PC2_IFID, pcCurrent_In, pcCurrent_IFID, halt, clk, rst);

    input [15:0] instr_In, PC2_In, pcCurrent_In;
    output [15:0] instr_IFID, PC2_IFID, pcCurrent_IFID;

    reg16bit reg0(.clk(clk),.rst(rst),.en(1'b1),.in(instr_In),.out(instr_IFID));
    reg16bit reg1(.clk(clk),.rst(rst),.en(1'b1),.in(PC2_In),.out(PC2_IFID));
    reg16bit pcReg0(.clk(clk),.rst(rst),.en(~halt),.in(pcCurrent_In),.out(pcCurrent_IFID));

endmodule
