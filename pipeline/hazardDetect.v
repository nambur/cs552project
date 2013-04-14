module hazardDetect(MemRead_IDEX,Rd2Addr_IDEX,Rd1Addr_IFID,Rd2Addr_IFID,stallCtrl,clk,rst);

    input [2:0] Rd2Addr_IDEX,Rd1Addr_IFID,Rd2Addr_IFID;
    input MemRead_IDEX;
    input clk,rst;
    //output
    output stallCtrl;

    wire stall2,a,b,c,flag,check,checkrst;
    wire flush;
    //flag that allows stall to run twice
    dff_en ff(.clk(clk),.rst(rst),.en(1'b1),.in(stall2),.out(check));

    //stall logic
    assign a = (Rd2Addr_IDEX == Rd1Addr_IFID);
    assign b = (Rd2Addr_IDEX == Rd2Addr_IFID);
    assign c = a|b;
    assign stall2 = MemRead_IDEX ? (c ? 1'b1 : 1'b0) : 1'b0;
    assign stallCtrl = (check | stall2);
    assign checkrst = (check|rst);

endmodule
