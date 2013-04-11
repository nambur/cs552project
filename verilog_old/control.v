//John Vennard and Nick Ambur
//Control Module
module control(instr,size,halt,zeroEx,regDst,jump,branch,memRead
		,memWrite,aluOp,aluF,memToReg,
		aluSrc,regWrite,dump,rst);
input [15:0] instr;
input rst;

<<<<<<< HEAD
output reg [1:0] size;
output [4:0] aluOp;
output reg [1:0] regDst,aluF;
output reg jump,branch,zeroEx,halt,memRead,memWrite,memToReg,aluSrc,regWrite,dump;
=======
output reg [1:0] size; //holds size of imm value in instruction
output [4:0] ALUOp;
output reg [1:0] RegDst,ALUF;
output reg Jump,Branch,zeroEx,halt,MemRead,MemWrite,MemtoReg,ALUSrc,RegWrite,Dump;
>>>>>>> 22d92accdabc6edd4b2d3168dfe511ab1bdce9fb

reg [1:0] aluF_tmp, regDst_tmp, aluF_tmp2, regDst_tmp2;
reg regWrite_tmp, regWrite_tmp2, zeroEx_tmp;

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
assign aluOp = instr[15:11];

//Internal control registers
wire add_r,sub_r,xor_r,andn_r,rol_r,sll_r,ror_r,srl_r;

//R-format instruction select logic
<<<<<<< HEAD
//
//
assign andn_r = (instr[1]) & (instr[0]);

assign add_r = (~instr[1]) & (~instr[0]);
assign sub_r = (~instr[1]) & (instr[0]);
assign xor_r = (instr[1]) & (~instr[0]);
assign andn_r = (instr[1]) & (instr[0]);
assign rol_r = (~instr[1]) & (~instr[0]);
assign sll_r = (~instr[1]) & (instr[0]);
assign ror_r = (instr[1]) & (~instr[0]);
assign srl_r = (instr[1]) & (instr[0]);
=======
assign andn_r = (Inst[1]) & (Inst[0]);
assign add_r = (~Inst[1]) & (~Inst[0]);
assign sub_r = (~Inst[1]) & (Inst[0]);
assign xor_r = (Inst[1]) & (~Inst[0]);
assign andn_r = (Inst[1]) & (Inst[0]);
assign rol_r = (~Inst[1]) & (~Inst[0]);
assign sll_r = (~Inst[1]) & (Inst[0]);
assign ror_r = (Inst[1]) & (~Inst[0]);
assign srl_r = (Inst[1]) & (Inst[0]);
>>>>>>> 22d92accdabc6edd4b2d3168dfe511ab1bdce9fb

// add_thru_andn
always @(*) begin
    casex (instr[1:0])
        2'b00: begin
<<<<<<< HEAD
            regDst_tmp = 2'b01; //R-format 
            aluF_tmp = 2'b00; 	  //same
            regWrite_tmp = 1'b1; //writing to reg...  

            regDst_tmp2 = 2'b01; //R-format 
            aluF_tmp2 = 2'b00; 	  //same
            regWrite_tmp2 = 1'b1; //writing to reg...  
        end
        2'b01: begin
            regDst_tmp = 2'b01; //R-format 
            aluF_tmp = 2'b01; 	  //same
            regWrite_tmp = 1'b1; //writing to reg...  

            regDst_tmp2 = 2'b01; //R-format 
            aluF_tmp2 = 2'b01; 	  //same
            regWrite_tmp2 = 1'b1; //writing to reg...  
        end
        2'b10: begin
            regDst_tmp = 2'b01; //R-format 
            aluF_tmp = 2'b10; 	  //same
            regWrite_tmp = 1'b1; //writing to reg...  

            regDst_tmp2 = 2'b01; //R-format 
            aluF_tmp2 = 2'b10; 	  //same
            regWrite_tmp2 = 1'b1; //writing to reg...  
        end
        2'b11: begin
            regDst_tmp = 2'b01; //R-format 
            aluF_tmp = 2'b11; 	  //same
            regWrite_tmp = 1'b1; //writing to reg... 
            zeroEx_tmp = 1'b1;

            regDst_tmp2 = 2'b01; //R-format 
            aluF_tmp2 = 2'b11; 	  //same
            regWrite_tmp2 = 1'b1; //writing to reg...  
=======
            RegDst_tmp = 2'b01; 
            ALUF_tmp = 2'b00; 
            RegWrite_tmp = 1'b1; 

            RegDst_tmp2 = 2'b01; //R-format 
            ALUF_tmp2 = 2'b00; 	
            RegWrite_tmp2 = 1'b1; //writing to reg...  
        end
        2'b01: begin
            RegDst_tmp = 2'b01; //R-format 
            ALUF_tmp = 2'b01; 
            RegWrite_tmp = 1'b1; 

            RegDst_tmp2 = 2'b01; //R-format 
            ALUF_tmp2 = 2'b01; 	 
            RegWrite_tmp2 = 1'b1; //writing to reg...  
        end
        2'b10: begin
            RegDst_tmp = 2'b01; //R-format 
            ALUF_tmp = 2'b10; 	
            RegWrite_tmp = 1'b1; //writing to reg...  

            RegDst_tmp2 = 2'b01; //R-format 
            ALUF_tmp2 = 2'b10; 
            RegWrite_tmp2 = 1'b1; //writing to reg...  
        end
        2'b11: begin
            RegDst_tmp = 2'b01; //R-format 
            ALUF_tmp = 2'b11; 
            RegWrite_tmp = 1'b1; //writing to reg... 
            zeroEx_tmp = 1'b1;

            RegDst_tmp2 = 2'b01; //R-format 
            ALUF_tmp2 = 2'b11; 
            RegWrite_tmp2 = 1'b1; //writing to reg...  
>>>>>>> 22d92accdabc6edd4b2d3168dfe511ab1bdce9fb
        end
    endcase
end

//case statement
always @(*) begin
	//default outputs
	size = 2'bxx;
	zeroEx = 1'b0;
	halt = 1'b0;
	regDst = 2'bxx; 
	jump = 1'b0;
	branch = 1'b0;
	memRead = 1'b0;
	memWrite = 1'b0;
	aluF = 2'bxx;
	memToReg = 1'b0;
	aluSrc = 1'b0;
	regWrite = 1'b0;
	dump = 1'b0;
	casex(instr[15:11])
		HALT: begin
		halt = 1'b1; //halts execution by disabling PC FF in fetch stage		
		dump = 1'b1; 	//dump Mem File Data
		end

		NOP: begin
		//Output set to Defaults
		regDst = 2'bxx; 
		aluF = 2'bxx;
		aluSrc = 1'bx;
		end

		ADDI: begin
		size = 2'b00;
<<<<<<< HEAD
		regDst = 2'b00; //correct for I-format 1
		aluSrc = 1'b1; //1 for sign extended ALU input
		regWrite = 1'b1; //writing to register...
=======
		RegDst = 2'b00; //I-format 1
		ALUSrc = 1'b1; //1 for sign extended ALU input
		RegWrite = 1'b1; //writing to register...
>>>>>>> 22d92accdabc6edd4b2d3168dfe511ab1bdce9fb
		end

		SUBI: begin
		size = 2'b00;
		regDst = 2'b00; //I-format 1 
		aluSrc = 1'b1; //sign extended input
		regWrite = 1'b1; //writing to register... 
		end

		XORI: begin
		size = 2'b00;
		zeroEx = 1'b1;
		regDst = 2'b00; //I-format 1 
		aluSrc = 1'b1; //sign extended input
		regWrite = 1'b1; //writing to register... 
		end

		ANDNI: begin
		size = 2'b00;
		zeroEx = 1'b1;
		regDst = 2'b00; //I-format 1 
		aluSrc = 1'b1; //sign extended input
		regWrite = 1'b1; //writing to register... 
		end

		ROLI: begin
		size = 2'b00;
		regDst = 2'b00; //I-format 1 
		aluSrc = 1'b1; //sign extended input
		regWrite = 1'b1; //writing to register... 
		end

		SLLI: begin
		size = 2'b00;
		regDst = 2'b00; //I-format 1 
		aluSrc = 1'b1; //sign extended input
		regWrite = 1'b1; //writing to register... 
		end

		RORI: begin
		size = 2'b00;
		regDst = 2'b00; //I-format 1 
		aluSrc = 1'b1; //sign extended input
		regWrite = 1'b1; //writing to register... 
		end

		SRLI:  begin
		size = 2'b00;
		regDst = 2'b00; //I-format 1 
		aluSrc = 1'b1; //sign extended input
		regWrite = 1'b1; //writing to register... 
		end

		ST:  begin
		size = 2'b00;
		memWrite = 1'b1; //writing to mem...
        regDst = 2'b00;
		aluSrc = 1'b1; 
		end	 	

		LD:  begin
		size = 2'b00;
<<<<<<< HEAD
        regDst = 2'b00;
		memRead = 1'b1; //reading from mem...
		memToReg = 1'b1; //memory to register
		aluSrc = 1'b1; 
		regWrite = 1'b1; //writing to reg...  
=======
        RegDst = 2'b00;
        MemWrite = 1'b0;
		MemRead = 1'b1; //reading from mem...
		MemtoReg = 1'b1; //memory to register
		ALUSrc = 1'b1; 
		RegWrite = 1'b1; //writing to reg...  
>>>>>>> 22d92accdabc6edd4b2d3168dfe511ab1bdce9fb
		end	 		 	

		STU:   begin
		size = 2'b00;
<<<<<<< HEAD
		regDst = 2'b10; //I-format 1 
		memWrite = 1'b1; //writing to mem...
		aluSrc = 1'b1; 
		regWrite = 1'b1; //also writing to register  
=======
		RegDst = 2'b10; //I-format 1 
		MemWrite = 1'b1; //writing to mem...
		ALUSrc = 1'b1;
        //MemtoReg must equal 0 to pass ALUO val through
        MemtoReg = 1'b0;
		RegWrite = 1'b1; //also writing to register  
>>>>>>> 22d92accdabc6edd4b2d3168dfe511ab1bdce9fb
		end	 	
	 		 
		//R-format Instructions	
		BTR:   begin
<<<<<<< HEAD
//REMOVE --    So yeah I have no fucking idea what this instruction does
		regDst = 2'b01; //R-format 
		jump = 1'b0;
		branch = 1'b0;
		memRead = 1'b0;
		memWrite = 1'b0; 
		aluF = 2'b00; 	  //same
		memToReg = 1'b0;
		aluSrc = 1'b0; 
		regWrite = 1'b1; //writing to reg...  
		dump = 1'b0; 
=======
		RegDst = 2'b01; //R-format 
		Jump = 1'b0;
		Branch = 1'b0;
		MemRead = 1'b0;
		MemWrite = 1'b0; 
		ALUF = 2'b00; 
		MemtoReg = 1'b0;
		ALUSrc = 1'b0; 
		RegWrite = 1'b1; //writing to reg...  
		Dump = 1'b0; 
>>>>>>> 22d92accdabc6edd4b2d3168dfe511ab1bdce9fb
		end	 	 	

		ADD_thru_ANDN: begin
        regDst = regDst_tmp; 
        aluF = aluF_tmp;
        regWrite = regWrite_tmp;
        zeroEx = zeroEx_tmp;
        end

	 	ROL_thru_SRL: begin
        regDst = regDst_tmp2; 
        aluF = aluF_tmp2;
        regWrite = regWrite_tmp2;
        end	
	
		SEQ: begin
		regDst = 2'b01; //R-format 
		regWrite = 1'b1; //writing to reg...  
		end

		SLT: begin
		regDst = 2'b01; //R-format 
		regWrite = 1'b1; //writing to reg...  
		end
		
		SLE: begin
		regDst = 2'b01; //R-format 
		regWrite = 1'b1; //writing to reg...  
		end

		SCO:  begin
		regDst = 2'b01; //R-format 
		regWrite = 1'b1; //writing to reg...  
		end
		
		//I-Format 2 Instructions
		BEQZ: begin
		size = 2'b01;
		regDst = 2'b10; //I-format 2 
		branch = 1'b1; 
		end

		BNEZ:  begin
		size = 2'b01;
<<<<<<< HEAD
		regDst = 2'b10; //I-format 2 
		branch = 1'b1; //CHANGE
=======
		RegDst = 2'b10; //I-format 2 
		Branch = 1'b1; 
>>>>>>> 22d92accdabc6edd4b2d3168dfe511ab1bdce9fb
		end

		BLTZ:  begin
		size = 2'b01;
<<<<<<< HEAD
		regDst = 2'b10; //I-format 2 
		branch = 1'b1; //CHANGE
=======
		RegDst = 2'b10; //I-format 2 
		Branch = 1'b1; 
>>>>>>> 22d92accdabc6edd4b2d3168dfe511ab1bdce9fb
		end

		BGEZ:  begin
		size = 2'b01;
<<<<<<< HEAD
		regDst = 2'b10; //I-format 2 
		branch = 1'b1; //CHANGE
=======
		RegDst = 2'b10; //I-format 2 
		Branch = 1'b1; 
>>>>>>> 22d92accdabc6edd4b2d3168dfe511ab1bdce9fb
		end

		LBI: begin
		size = 2'b01;
<<<<<<< HEAD
		regDst = 2'b10; //I-format 2 
		aluSrc = 1'bx;	//might have to change 
		regWrite = 1'b1; //writing to reg...  
=======
		RegDst = 2'b10; //I-format 2 
		ALUSrc = 1'bx;	
		RegWrite = 1'b1; //writing to reg...  
>>>>>>> 22d92accdabc6edd4b2d3168dfe511ab1bdce9fb
		end

		SLBI:  begin
		size = 2'b01;
<<<<<<< HEAD
		regDst = 2'b10; //I-format 2 
		aluSrc = 1'b1;	//might have to change 
		regWrite = 1'b1; //writing to reg... 
=======
		RegDst = 2'b10; //I-format 2 
		ALUSrc = 1'b1;
		RegWrite = 1'b1; //writing to reg... 
>>>>>>> 22d92accdabc6edd4b2d3168dfe511ab1bdce9fb
        zeroEx = 1'b1;
		end

		//J-Format Instructions
		J: begin
		size = 2'b10;
		jump = 1'b1;  //jumping... 
		end

		JR:  begin
		size = 2'b01;
		regDst = 2'b10;	
		jump = 1'b1;  //jumping...
		aluSrc = 1'b1; 
		end

		JAL: begin
		size = 2'b10;
		jump = 1'b1;  //jumping... 
		regWrite = 1'b1; //writing to reg r7... 
        regDst = 2'b11;
		end

		JALR: begin
		size = 2'b01;
		regDst = 2'b11;	
		jump = 1'b1;  //jumping... 
		aluSrc = 1'b1;	 
		regWrite = 1'b1; //writing to reg r7...  
		end

//EXTRA CREDIT
		SIIC: begin
		//SHOULD PRODUCE ILLEGALOP EXCEPTION
		//DEFAULTED IN THIS IMPLEMENTATION
		regDst = 2'bxx; //Ignored 
		jump = 1'b0;  
		branch = 1'b0; 
		memRead = 1'bx;
		memWrite = 1'b0; 
		memToReg = 1'b0;
		aluSrc = 1'b0;	 
		regWrite = 1'b0;  
		end

		NOP_RTI: begin
		//PC <- EPC
		//DEFAULTED IN THIS IMPLEMENTATION
		regDst = 2'b00; //Ignored 
		jump = 1'b0;  
		branch = 1'b0; 
		memRead = 1'b0;
		memWrite = 1'b0; 
		aluF = 2'b00; 	 
		memToReg = 1'b0;
		aluSrc = 1'b0;	 
		regWrite = 1'b0;  
		dump = 1'b0; 
		end
		//defaults
	endcase
end

endmodule
