module carryLA_bench;
    reg[3:0] A, B;
    reg CI;
    wire[3:0] SUM;
    wire CO, Ofl;

    carryLA_4b FA(.A(A), .B(B), .SUM(SUM), .CI(CI), .CO(CO), .Ofl(Ofl));

    initial
    begin
        CI = 1'b0;
        A = 4'hf;
        B = 4'hf;
        #100;
/*
    
        //1
        A = 4'hF;
        B = 4'h1;
        CI = 1'b0;

        //2
        #10;
        A = 4'h6;
        B = 4'h2;

        //3
        #10;
        A = 4'h1;
        B = 4'h3;

        //4
        #10;
        A = 4'h9;
        B = 4'h2;

        //5
        #10;
        A = 4'hA;
        B = 4'h1;

        //6
        #10;
        A = 4'h2;
        B = 4'h8;

        //7
        #10;
        A = 4'h3;
        B = 4'hA;
        
        //8
        #10;
        A = 4'h5;
        B = 4'h5;
        */

        #10 $finish;
    end
endmodule
