module execute_stage_bench;

    reg [15:0] PC2, Rd1, Rd2, Imm;
    reg [4:0] ALUOp;
    reg [1:0] ALUF;
    reg ALUSrc, Branch;

    wire [15:0] PCS, ALUO;
    wire [2:0] flag;
    wire err;
    
    execute_stage EX(.PC2(PC2), .ALUSrc(ALUSrc), .ALUOp(ALUOp), .Rd1(Rd1), .Rd2(Rd2), .Imm(Imm),
            .ALUF(ALUF), .Branch(Branch), .PCS(PCS), .flag(flag), .ALUO(ALUO), .err(err));


    initial begin
        // addi 
        PC2 = 16'h0002;
        Rd1 = 16'h0001;
        Rd2 = 16'h0002;
        Imm = 16'h0004;
        ALUOp = 5'b01000; // addi
        ALUF = 2'b00;
        ALUSrc = 1'b1;
        Branch = 1'b0;

        #100;
        $stop;

        // subi
        PC2 = 16'h0002;
        Rd1 = 16'h0006;
        Rd2 = 16'h0001;
        Imm = 16'h0004;
        ALUOp = 5'b01001;
        ALUF = 2'b00;
        ALUSrc = 1'b1;
        Branch = 1'b0;

        #100;
        $stop;

        // xori
        PC2 = 16'h0002;
        Rd1 = 16'h0006;
        Rd2 = 16'h0001;
        Imm = 16'h0004;
        ALUOp = 5'b01010;
        ALUF = 2'b00;
        ALUSrc = 1'b1;
        Branch = 1'b0;

        #100;
        $stop;

        // andni
        PC2 = 16'h0002;
        Rd1 = 16'h0006;
        Rd2 = 16'h0001;
        Imm = 16'h0004;
        ALUOp = 5'b01011;
        ALUF = 2'b00;
        ALUSrc = 1'b1;
        Branch = 1'b0;

        #100;
        $stop;

        // roli
        PC2 = 16'h0002;
        Rd1 = 16'h0006;
        Rd2 = 16'h0001;
        Imm = 16'h0004;
        ALUOp = 5'b10100;
        ALUF = 2'b00;
        ALUSrc = 1'b1;
        Branch = 1'b0;

        #100;
        $stop;

        // slli
        PC2 = 16'h0002;
        Rd1 = 16'h0006;
        Rd2 = 16'h0001;
        Imm = 16'h0004;
        ALUOp = 5'b10101;
        ALUF = 2'b00;
        ALUSrc = 1'b1;
        Branch = 1'b0;

        #100;
        $stop;

        // rori
        PC2 = 16'h0002;
        Rd1 = 16'h0006;
        Rd2 = 16'h0001;
        Imm = 16'h0004;
        ALUOp = 5'b10110;
        ALUF = 2'b00;
        ALUSrc = 1'b1;
        Branch = 1'b0;

        #100;
        $stop;

        // srli
        PC2 = 16'h0002;
        Rd1 = 16'h0006;
        Rd2 = 16'h0001;
        Imm = 16'h0004;
        ALUOp = 5'b10111;
        ALUF = 2'b00;
        ALUSrc = 1'b1;
        Branch = 1'b0;

        #100;
        $stop;

        // st
        PC2 = 16'h0002;
        Rd1 = 16'h0006;
        Rd2 = 16'h0001;
        Imm = 16'h0004;
        ALUOp = 5'b10111;
        ALUF = 2'b00;
        ALUSrc = 1'b1;
        Branch = 1'b0;

        #100;
        $stop;
    end
endmodule
