module hazardDetect(takeBranch_EXMEM,RegWrite_IDEX,RegWrite_EXMEM,WrR_IDEX,WrR_EXMEM,Rd1Addr_IFID,Rd2Addr_IFID,
            stallCtrl,clk,rst,Jump_IDEX,jumpFlush,WrR_MEMWB,RegWrite_MEMWB);

    input [2:0] WrR_IDEX,WrR_EXMEM,WrR_MEMWB,Rd1Addr_IFID,Rd2Addr_IFID;
    input RegWrite_IDEX,RegWrite_EXMEM,Jump_IDEX;
    input clk,rst,takeBranch_EXMEM;
    output stallCtrl,jumpFlush,RegWrite_MEMWB;

    wire stall2,stall3,a,b,c,d,e,f,stall1,checkSt3,checkSt3Out,checkJump,checkTemp,checkSt2Out,checkTemp1,checkTemp2;

    //flag that allows stall to run twice
    dff_en ff(.clk(clk),.rst(rst),.en(1'b1),.in(stall3),.out(checkSt3));
    dff_en ff2(.clk(clk),.rst(rst),.en(1'b1),.in(checkSt3),.out(checkSt3Out));
    dff_en ff3(.clk(clk),.rst(rst),.en(1'b1),.in(stall2),.out(checkSt2Out));
    dff_en ff4(.clk(clk),.rst(rst),.en(1'b1),.in(Jump_IDEX),.out(checkJump));
    
    //TODO added code for clearing data after a jump is detected
    assign jumpFlush = (Jump_IDEX | checkJump);

    //stall logic
    assign a = WrR_IDEX == Rd1Addr_IFID;
    assign b = WrR_IDEX == Rd2Addr_IFID;
    assign c = WrR_EXMEM == Rd1Addr_IFID;
    assign d = WrR_EXMEM == Rd2Addr_IFID;
    assign e = WrR_MEMWB == Rd1Addr_IFID;
    assign f = WrR_MEMWB == Rd2Addr_IFID;

    assign stall3 = takeBranch_EXMEM ? 1'b0 :((RegWrite_IDEX) ? (a|b) : 1'b0);
    assign stall2 = takeBranch_EXMEM ? 1'b0 : ((RegWrite_EXMEM) ? (c|d) : 1'b0);
    assign stall1 = takeBranch_EXMEM ? 1'b0 : ((RegWrite_MEMWB) ? (e|f) : 1'b0);

    assign checkTemp = takeBranch_EXMEM ? 1'b0 : checkSt3Out;
    assign checkTemp1 = takeBranch_EXMEM ? 1'b0 : checkSt2Out;
    assign checkTemp2 = takeBranch_EXMEM ? 1'b0 : checkSt3;

    assign stallCtrl = stall3 | checkTemp2 | checkTemp | stall2 | checkTemp1 | stall1;

endmodule
