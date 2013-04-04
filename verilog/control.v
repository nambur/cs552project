//John Vennard and Nick Ambur
//Control Module
module control(Inst,size,halt,zeroEx,RegDst,Jump,Branch,MemRead
		,MemWrite,ALUOp,ALUF,MemtoReg,
		ALUSrc,RegWrite,Dump,rst);
input [15:0] Inst;
input rst;

output reg [1:0] size;
output [4:0] ALUOp;
output reg [1:0] RegDst,ALUF;
output reg Jump,Branch,zeroEx,halt,MemRead,MemWrite,MemtoReg,ALUSrc,RegWrite,Dump;

reg [1:0] ALUF_tmp, RegDst_tmp, ALUF_tmp2, RegDst_tmp2;
reg RegWrite_tmp, RegWrite_tmp2, zeroEx_tmp;

//Include constant definitions for opcodes 
localparam HALT = 5'b00000;
localparam NOP = 5'b00001;

localparam ADDI = 5'b01000;
localparam SUBI = 5'b01001;
localparam XORI = 5'b01010;
localparam ANDNI = 5'b01011;
localparam ROLI = 5'b10100;
localparam SLLI = 5'b10101;
localparam RORI = 5'b10110;
localparam SRLI = 5'b10111;
localparam ST = 5'b10000;
localparam LD = 5'b10001;
localparam STU = 5'b10011;

localparam BTR = 5'b11001;
localparam ADD_thru_ANDN = 5'b11011;
localparam ROL_thru_SRL = 5'b11010;
localparam SEQ = 5'b11100;
localparam SLT = 5'b11101;
localparam SLE = 5'b11110;
localparam SCO = 5'b11111;

localparam BEQZ = 5'b01100;
localparam BNEZ = 5'b01101;
localparam BLTZ = 5'b01110;
localparam BGEZ = 5'b01111;
localparam LBI = 5'b11000;
localparam SLBI = 5'b10010;

localparam J = 5'b00100;
localparam JR = 5'b00101;
localparam JAL = 5'b00110;
localparam JALR = 5'b00111;

localparam SIIC = 5'b00010;
localparam NOP_RTI = 5'b00011;

//ALUControl
assign ALUOp = Inst[15:11];

//Internal control registers
wire add_r,sub_r,xor_r,andn_r,rol_r,sll_r,ror_r,srl_r;

//R-format instruction select logic
//
//
assign andn_r = (Inst[1]) & (Inst[0]);

assign add_r = (~Inst[1]) & (~Inst[0]);
assign sub_r = (~Inst[1]) & (Inst[0]);
assign xor_r = (Inst[1]) & (~Inst[0]);
assign andn_r = (Inst[1]) & (Inst[0]);
assign rol_r = (~Inst[1]) & (~Inst[0]);
assign sll_r = (~Inst[1]) & (Inst[0]);
assign ror_r = (Inst[1]) & (~Inst[0]);
assign srl_r = (Inst[1]) & (Inst[0]);

// add_thru_andn
always @(*) begin
    casex (Inst[1:0])
        2'b00: begin
            RegDst_tmp = 2'b01; //R-format 
            ALUF_tmp = 2'b00; 	  //same
            RegWrite_tmp = 1'b1; //writing to reg...  

            RegDst_tmp2 = 2'b01; //R-format 
            ALUF_tmp2 = 2'b00; 	  //same
            RegWrite_tmp2 = 1'b1; //writing to reg...  
        end
        2'b01: begin
            RegDst_tmp = 2'b01; //R-format 
            ALUF_tmp = 2'b01; 	  //same
            RegWrite_tmp = 1'b1; //writing to reg...  

            RegDst_tmp2 = 2'b01; //R-format 
            ALUF_tmp2 = 2'b01; 	  //same
            RegWrite_tmp2 = 1'b1; //writing to reg...  
        end
        2'b10: begin
            RegDst_tmp = 2'b01; //R-format 
            ALUF_tmp = 2'b10; 	  //same
            RegWrite_tmp = 1'b1; //writing to reg...  

            RegDst_tmp2 = 2'b01; //R-format 
            ALUF_tmp2 = 2'b10; 	  //same
            RegWrite_tmp2 = 1'b1; //writing to reg...  
        end
        2'b11: begin
            RegDst_tmp = 2'b01; //R-format 
            ALUF_tmp = 2'b11; 	  //same
            RegWrite_tmp = 1'b1; //writing to reg... 
            zeroEx_tmp = 1'b1;

            RegDst_tmp2 = 2'b01; //R-format 
            ALUF_tmp2 = 2'b11; 	  //same
            RegWrite_tmp2 = 1'b1; //writing to reg...  
        end
    endcase
end

//case statement
always @(*) begin
	//default outputs
	size = 2'bxx;
	zeroEx = 1'b0;
	halt = 1'b0;
	RegDst = 2'bxx; 
	Jump = 1'b0;
	Branch = 1'b0;
	MemRead = 1'b0;
	MemWrite = 1'b0;
	ALUF = 2'bxx;
	MemtoReg = 1'b0;
	ALUSrc = 1'b0;
	RegWrite = 1'b0;
	Dump = 1'b0;
	casex(Inst[15:11])
		HALT: begin
		halt = 1'b1; //halts execution by disabling PC FF in fetch stage		
		Dump = 1'b1; 	//Dump Mem File Data
		end

		NOP: begin
		//Output set to Defaults
		RegDst = 2'bxx; 
		ALUF = 2'bxx;
		ALUSrc = 1'bx;
		end

		ADDI: begin
		size = 2'b00;
		RegDst = 2'b00; //correct for I-format 1
		ALUSrc = 1'b1; //1 for sign extended ALU input
		RegWrite = 1'b1; //writing to register...
		end

		SUBI: begin
		size = 2'b00;
		RegDst = 2'b00; //I-format 1 
		ALUSrc = 1'b1; //sign extended input
		RegWrite = 1'b1; //writing to register... 
		end

		XORI: begin
		size = 2'b00;
		zeroEx = 1'b1;
		RegDst = 2'b00; //I-format 1 
		ALUSrc = 1'b1; //sign extended input
		RegWrite = 1'b1; //writing to register... 
		end

		ANDNI: begin
		size = 2'b00;
		zeroEx = 1'b1;
		RegDst = 2'b00; //I-format 1 
		ALUSrc = 1'b1; //sign extended input
		RegWrite = 1'b1; //writing to register... 
		end

		ROLI: begin
		size = 2'b00;
		RegDst = 2'b00; //I-format 1 
		ALUSrc = 1'b1; //sign extended input
		RegWrite = 1'b1; //writing to register... 
		end

		SLLI: begin
		size = 2'b00;
		RegDst = 2'b00; //I-format 1 
		ALUSrc = 1'b1; //sign extended input
		RegWrite = 1'b1; //writing to register... 
		end

		RORI: begin
		size = 2'b00;
		RegDst = 2'b00; //I-format 1 
		ALUSrc = 1'b1; //sign extended input
		RegWrite = 1'b1; //writing to register... 
		end

		SRLI:  begin
		size = 2'b00;
		RegDst = 2'b00; //I-format 1 
		ALUSrc = 1'b1; //sign extended input
		RegWrite = 1'b1; //writing to register... 
		end

		ST:  begin
		size = 2'b00;
		MemWrite = 1'b1; //writing to mem...
        RegDst = 2'b00;
		ALUSrc = 1'b1; 
		end	 	

		LD:  begin
		size = 2'b00;
        RegDst = 2'b00;
		MemRead = 1'b1; //reading from mem...
		MemtoReg = 1'b1; //memory to register
		ALUSrc = 1'b1; 
		RegWrite = 1'b1; //writing to reg...  
		end	 		 	

		STU:   begin
		size = 2'b00;
		RegDst = 2'b10; //I-format 1 
		MemWrite = 1'b1; //writing to mem...
		ALUSrc = 1'b1; 
		RegWrite = 1'b1; //also writing to register  
		end	 	
	 		 
		//R-format Instructions	
		BTR:   begin
//REMOVE --    So yeah I have no fucking idea what this instruction does
		RegDst = 2'b01; //R-format 
		Jump = 1'b0;
		Branch = 1'b0;
		MemRead = 1'b0;
		MemWrite = 1'b0; 
		ALUF = 2'b00; 	  //same
		MemtoReg = 1'b0;
		ALUSrc = 1'b0; 
		RegWrite = 1'b1; //writing to reg...  
		Dump = 1'b0; 
		end	 	 	

		ADD_thru_ANDN: begin
        RegDst = RegDst_tmp; 
        ALUF = ALUF_tmp;
        RegWrite = RegWrite_tmp;
        zeroEx = zeroEx_tmp;
        end

	 	ROL_thru_SRL: begin
        RegDst = RegDst_tmp2; 
        ALUF = ALUF_tmp2;
        RegWrite = RegWrite_tmp2;
        end	
	
		SEQ: begin
		RegDst = 2'b01; //R-format 
		RegWrite = 1'b1; //writing to reg...  
		end

		SLT: begin
		RegDst = 2'b01; //R-format 
		RegWrite = 1'b1; //writing to reg...  
		end
		
		SLE: begin
		RegDst = 2'b01; //R-format 
		RegWrite = 1'b1; //writing to reg...  
		end

		SCO:  begin
		RegDst = 2'b01; //R-format 
		RegWrite = 1'b1; //writing to reg...  
		end
		
		//I-Format 2 Instructions
		BEQZ: begin
		size = 2'b01;
		RegDst = 2'b10; //I-format 2 
		Branch = 1'b1; 
		end

		BNEZ:  begin
		size = 2'b01;
		RegDst = 2'b10; //I-format 2 
		Branch = 1'b1; //CHANGE
		end

		BLTZ:  begin
		size = 2'b01;
		RegDst = 2'b10; //I-format 2 
		Branch = 1'b1; //CHANGE
		end

		BGEZ:  begin
		size = 2'b01;
		RegDst = 2'b10; //I-format 2 
		Branch = 1'b1; //CHANGE
		end

		LBI: begin
		size = 2'b01;
		RegDst = 2'b10; //I-format 2 
		ALUSrc = 1'bx;	//might have to change 
		RegWrite = 1'b1; //writing to reg...  
		end

		SLBI:  begin
		size = 2'b01;
		RegDst = 2'b10; //I-format 2 
		ALUSrc = 1'b1;	//might have to change 
		RegWrite = 1'b1; //writing to reg... 
        zeroEx = 1'b1;
		end

		//J-Format Instructions
		J: begin
		size = 2'b10;
		Jump = 1'b1;  //jumping... 
		end

		JR:  begin
		size = 2'b01;
		RegDst = 2'b10;	
		Jump = 1'b1;  //jumping...
		ALUSrc = 1'b1; 
		end

		JAL: begin
		size = 2'b10;
		Jump = 1'b1;  //jumping... 
		RegWrite = 1'b1; //writing to reg r7... 
        RegDst = 2'b11;
		end

		JALR: begin
		size = 2'b01;
		RegDst = 2'b11;	
		Jump = 1'b1;  //jumping... 
		ALUSrc = 1'b1;	 
		RegWrite = 1'b1; //writing to reg r7...  
		end

//EXTRA CREDIT
		SIIC: begin
		//SHOULD PRODUCE ILLEGALOP EXCEPTION
		//DEFAULTED IN THIS IMPLEMENTATION
		RegDst = 2'bxx; //Ignored 
		Jump = 1'b0;  
		Branch = 1'b0; 
		MemRead = 1'bx;
		MemWrite = 1'b0; 
		MemtoReg = 1'b0;
		ALUSrc = 1'b0;	 
		RegWrite = 1'b0;  
		end

		NOP_RTI: begin
		//PC <- EPC
		//DEFAULTED IN THIS IMPLEMENTATION
		RegDst = 2'b00; //Ignored 
		Jump = 1'b0;  
		Branch = 1'b0; 
		MemRead = 1'b0;
		MemWrite = 1'b0; 
		ALUF = 2'b00; 	 
		MemtoReg = 1'b0;
		ALUSrc = 1'b0;	 
		RegWrite = 1'b0;  
		Dump = 1'b0; 
		end
		//defaults
	endcase
end

endmodule
