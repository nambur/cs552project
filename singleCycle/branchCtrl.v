module branchCtrl(Jump, Branch, branchType, flag, takeBranch);
    
    input Branch, Jump;
    input [2:0] flag;
    input [1:0] branchType;
    output takeBranch;

    reg muxOut;

    assign takeBranch = Jump | (muxOut & Branch);

    always @(*) begin
        casex (branchType)
            2'b00: muxOut = (flag[0]) ? 1'b1 : 1'b0;
            2'b01: muxOut = (flag[0]) ? 1'b0 : 1'b1;
            2'b10: muxOut = (flag[2]) ? 1'b1 : 1'b0;
            2'b11: muxOut = (~flag[2] | flag[0]) ? 1'b1 : 1'b0;
        endcase
    end
    
endmodule
