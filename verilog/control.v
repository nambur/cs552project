//John Vennard and Nick Ambur
//Control Module
module control(instr,size,halt,zeroEx,regDst,jump,branch,MemRead
		,MemWrite,aluOp,aluF,MemtoReg,
		aluSrc,regWrite,dump,rst);
input [15:0] instr;
input rst;

output reg [1:0] size;
output [4:0] aluOp;
output reg [1:0] regDst,aluF;
output reg jump,branch,zeroEx,halt,MemRead,MemWrite,MemtoReg,aluSrc,regWrite,dump;

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

// add_thru_andn
always @(*) begin
    casex (instr[1:0])
        2'b00: begin
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
	MemRead = 1'b0;
	MemWrite = 1'b0;
	aluF = 2'bxx;
	MemtoReg = 1'b0;
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
		regDst = 2'b00; //correct for I-format 1
		aluSrc = 1'b1; //1 for sign extended ALU input
		regWrite = 1'b1; //writing to register...
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
		MemWrite = 1'b1; //writing to mem...
        regDst = 2'b00;
		aluSrc = 1'b1; 
		end	 	

		LD:  begin
		size = 2'b00;
        regDst = 2'b00;
		MemRead = 1'b1; //reading from mem...
		MemtoReg = 1'b1; //memory to register
		aluSrc = 1'b1; 
		regWrite = 1'b1; //writing to reg...  
		end	 		 	

		STU:   begin
		size = 2'b00;
		regDst = 2'b10; //I-format 1 
		MemWrite = 1'b1; //writing to mem...
		aluSrc = 1'b1; 
		regWrite = 1'b1; //also writing to register  
		end	 	
	 		 
		//R-format Instructions	
		BTR:   begin
//REMOVE --    So yeah I have no fucking idea what this instruction does
		regDst = 2'b01; //R-format 
		jump = 1'b0;
		branch = 1'b0;
		MemRead = 1'b0;
		MemWrite = 1'b0; 
		aluF = 2'b00; 	  //same
		MemtoReg = 1'b0;
		aluSrc = 1'b0; 
		regWrite = 1'b1; //writing to reg...  
		dump = 1'b0; 
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
		regDst = 2'b10; //I-format 2 
		branch = 1'b1; //CHANGE
		end

		BLTZ:  begin
		size = 2'b01;
		regDst = 2'b10; //I-format 2 
		branch = 1'b1; //CHANGE
		end

		BGEZ:  begin
		size = 2'b01;
		regDst = 2'b10; //I-format 2 
		branch = 1'b1; //CHANGE
		end

		LBI: begin
		size = 2'b01;
		regDst = 2'b10; //I-format 2 
		aluSrc = 1'bx;	//might have to change 
		regWrite = 1'b1; //writing to reg...  
		end

		SLBI:  begin
		size = 2'b01;
		regDst = 2'b10; //I-format 2 
		aluSrc = 1'b1;	//might have to change 
		regWrite = 1'b1; //writing to reg... 
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
		MemRead = 1'bx;
		MemWrite = 1'b0; 
		MemtoReg = 1'b0;
		aluSrc = 1'b0;	 
		regWrite = 1'b0;  
		end

		NOP_RTI: begin
		//PC <- EPC
		//DEFAULTED IN THIS IMPLEMENTATION
		regDst = 2'b00; //Ignored 
		jump = 1'b0;  
		branch = 1'b0; 
		MemRead = 1'b0;
		MemWrite = 1'b0; 
		aluF = 2'b00; 	 
		MemtoReg = 1'b0;
		aluSrc = 1'b0;	 
		regWrite = 1'b0;  
		dump = 1'b0; 
		end
		//defaults
	endcase
end

endmodule
