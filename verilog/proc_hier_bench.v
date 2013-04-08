
/* $Author: karu $ */
/* $LastChangedDate: 2009-03-04 23:09:45 -0600 (Wed, 04 Mar 2009) $ */
/* $Rev: 45 $ */
module proc_hier_bench();

   /* BEGIN DO NOT TOUCH */
   
   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   // End of automatics
   

   wire [15:0] PC;
   wire [15:0] Inst,Inst1;           /* This should be the 15 bits of the FF that
                                  stores instructions fetched from instruction memory
                               */
   wire        RegWrite;       /* Whether register file is being written to */
   wire [2:0]  WriteRegister;  /* What register is written */
   wire [15:0] WriteData, WrD;      /* Data */
   wire        MemWrite;       /* Similar as above but for memory */
   wire        MemRead;
   wire [15:0] MemAddress,aluResult;
   wire [15:0] MemData,memDataIn;
   wire [15:0] Imm;
   wire immpass,doSLBI;
   wire [1:0] size;
   wire [2:0] flag, WrR;
   wire [15:0] Rd1,Rd2, aluOut,memOut, addA, addB, addSum;
    wire [2:0] Op;
   wire        Halt;         /* Halt executed and in Memory or writeback stage */
   wire takeBranch,memReadorWrite,memWrite ;
   wire CO;
   wire [15:0] pcNext, RdD;
        
   integer     inst_count;
   integer     trace_file;
   integer     sim_log_file;
     

   proc_hier DUT();
   

   initial begin
      $display("Hello world...simulation starting");
      $display("See verilogsim.log and verilogsim.trace for output");
      inst_count = 0;
      trace_file = $fopen("verilogsim.trace");
      sim_log_file = $fopen("verilogsim.log");
      
   end

   always @ (posedge DUT.c0.clk) begin
      if (!DUT.c0.rst) begin
         if (Halt || RegWrite || MemWrite) begin
            inst_count = inst_count + 1;
         end
         $fdisplay(sim_log_file, "SIMLOG:: Cycle %d PC: %8x I: %8x R: %d %3d %8x M: %d %d %8x %8x",
                  DUT.c0.cycle_count,
                  PC,
                  Inst,
                  RegWrite,
                  WriteRegister,
                  WriteData,
                  MemRead,
                  MemWrite,
                  MemAddress,
                  MemData);
         if (RegWrite) begin
            if (MemWrite) begin
               // stu
               $fdisplay(trace_file,"INUM: %8d PC: 0x%04x REG: %d VALUE: 0x%04x ADDR: 0x%04x VALUE: 0x%04x",
                         (inst_count-1),
                        PC,
                        WriteRegister,
                        WriteData,
                      MemAddress,
                        MemData);
              //  $fdisplay(trace_file, "memDatain memory.v : x%x",memDataIn);
             //  $fdisplay(trace_file, "WriteData in Decode: 0x%x", WriteData);
               //$fdisplay(trace_file, "Imm: 0x%x", Imm);
               // $fdisplay(trace_file, "size from decode: x%b",size);
               // $fdisplay(trace_file, "aluResult: 0x%x", aluResult);
              // $fdisplay(trace_file, "memRead: 0x%x", MemRead);
                //$fdisplay(trace_file, "memWrite: 0x%x", memWrite);
                //$fdisplay(trace_file, "memReadorWrite: 0x%x", memReadorWrite);        
                // $fdisplay(trace_file, "addr from aluResult: 0x%x", aluResult);
              //  $fdisplay(trace_file, "memWrite: 0x%x", MemWrite);
               //$fdisplay(trace_file, "writeregsel: 0x%x", writeregsel);
                // $fdisplay(trace_file, "intruction input: 0x%x", Inst1);
                // $fdisplay(trace_file, "Rd2 (also write data into mem): 0x%x", Rd2);
                 //$fdisplay(trace_file, "Rd1: 0x%x", Rd1);
               //  $fdisplay(trace_file, "RdD out of memory.v: 0x%x", RdD);
             //  $fdisplay(trace_file, "data out of writeback: 0x%x", WrD);
             //  $fdisplay(trace_file, "WriteData in Decode: 0x%x", WriteData);
            //   $fdisplay(trace_file, "Decode register write addr: 0x%b", WrR);
              // $fdisplay(trace_file, "ENDING STU IF STATEMENT ----");
            end else if (MemRead) begin
               // ld
               $fdisplay(trace_file,"INUM: %8d PC: 0x%04x REG: %d VALUE: 0x%04x ADDR: 0x%04x",
                         (inst_count-1),
                        PC,
                        WriteRegister,
                        WriteData,
                        MemAddress);
                     //   $fdisplay(trace_file, "Rd2: 0x%x", Rd2);
             //  $fdisplay(trace_file, "Rd1: 0x%x", Rd1);

                // $fdisplay(trace_file, "RdD out of memory.v: 0x%x", RdD);
                // $fdisplay(trace_file, "addr from aluResult: 0x%x", aluResult);
              //   $fdisplay(trace_file, "memReadorWrite: 0x%x", memRorW);
                // $fdisplay(trace_file, "memWrite: 0x%x", memWrite);
               //$fdisplay(trace_file, "memRead: 0x%x", memRead);
               // $fdisplay(trace_file, "intruction input: 0x%x", Inst1);
           //     $fdisplay(trace_file, "memReadorWrite: 0x%x", memReadorWrite);        
              // $fdisplay(trace_file, "RdD: 0x%x", memOut);
            end else begin
                //addi
               $fdisplay(trace_file,"INUM: %8d PC: 0x%04x REG: %d VALUE: 0x%04x",
                         (inst_count-1),
                        PC,
                        WriteRegister,
                        WriteData );
             // $fdisplay(trace_file, "Imm: 0x%x", Imm);
           //    $fdisplay(trace_file, "immpass: 0x%x", immpass);
         //      $fdisplay(trace_file, "inst: 0x%x", Inst);
           //    $fdisplay(trace_file, "slbiOut: 0x%x", slbiOut);
             //  $fdisplay(trace_file, "Rd1: 0x%x", Rd1);
               //$fdisplay(trace_file, "writeregsel: 0x%x", writeregsel);
               //$fdisplay(trace_file, "write: 0x%x", write);
            //   $fdisplay(trace_file, "invB: 0x%x", invB);
            //   $fdisplay(trace_file, "Rd1: 0x%x", Rd1);
            //  $fdisplay(trace_file, "Rd2: 0x%x", Rd2);
            //   $fdisplay(trace_file, "aluOut: 0x%x", aluOut);
           //    $fdisplay(trace_file, "Op: 0x%x", Op);
               //$fdisplay(trace_file, "flag: 0x%x", flag);
               //$fdisplay(trace_file, "takeBranch: 0x%x", takeBranch);
              // $fdisplay(trace_file, "pcNext: 0x%x", pcNext);
            //   $fdisplay(trace_file, "CO: 0x%x", CO);
           //    $fdisplay(trace_file, "addA: 0x%x addB: 0x%x addSum: 0x%x CO: 0x%x", addA, addB, addSum, CO);
            end
         end else if (Halt) begin
            $fdisplay(sim_log_file, "SIMLOG:: Processor halted\n");
            $fdisplay(sim_log_file, "SIMLOG:: sim_cycles %d\n", DUT.c0.cycle_count);
            $fdisplay(sim_log_file, "SIMLOG:: inst_count %d\n", inst_count);
            $fdisplay(trace_file, "INUM: %8d PC: 0x%04x",
                      (inst_count-1),
                      PC );
               //  $fdisplay(trace_file, "thinks its a halt");
             //  $fdisplay(trace_file, "inst: 0x%x", Inst);

            $fclose(trace_file);
            $fclose(sim_log_file);
            
            $finish;
         end else begin // if (RegWrite)
            if (MemWrite) begin
               // st
               $fdisplay(trace_file,"INUM: %8d PC: 0x%04x ADDR: 0x%04x VALUE: 0x%04x",
                         (inst_count-1),
                        PC,
                        MemAddress,
                        MemData);
            end else begin
               // conditional branch or NOP
               // Need better checking in pipelined testbench
               inst_count = inst_count + 1;
               $fdisplay(trace_file, "INUM: %8d PC: 0x%04x",
                         (inst_count-1),
                         PC );
              //           $fdisplay(trace_file, "thinks its a branch");
             // $fdisplay(trace_file, "takeBranch: 0x%x", takeBranch);
              // $fdisplay(trace_file, "aluOut: 0x%x", aluOut);
             //  $fdisplay(trace_file, "pcNext: 0x%x", pcNext);
             //  $fdisplay(trace_file, "Imm: 0x%x", Imm);
               end
         end 
      end
      
   end

   /* END DO NOT TOUCH */

   /* Assign internal signals to top level wires
      The internal module names and signal names will vary depending
      on your naming convention and your design */

   // Edit the example below. You must change the signal
   // names on the right hand side
    assign WrD = DUT.p0.WrD;
   assign PC = DUT.p0.fetch0.pcCurrent;
   assign Inst = DUT.p0.fetch0.instr;
   
   assign regWrite = DUT.p0.decode0.regFile0.write;
   // Is memory being read, one bit signal (1 means yes, 0 means no)
   
   assign writeRegister = DUT.p0.decode0.regFile0.writeregsel;
   // The name of the register being written to. (3 bit signal)

<<<<<<< HEAD
   assign writeData = DUT.p0.decode0.regFile0.writedata;
=======
   assign WriteData = DUT.p0.decode0.regFile0.writedata;
>>>>>>> 22d92accdabc6edd4b2d3168dfe511ab1bdce9fb
   // Data being written to the register. (16 bits)
   
   assign memRead =  DUT.p0.memory0.memRead;
   // Is memory being read, one bit signal (1 means yes, 0 means no)
   
   assign memWrite = DUT.p0.memory0.memWrite;
   // Is memory being written to (1 bit signal)
   
   assign exOut = DUT.p0.memory0.exOut;
   // Address to access memory with (for both reads and writes to memory, 16 bits)
   
<<<<<<< HEAD
   assign dataIn = DUT.p0.memory0.dataIn;
=======
   //added
   assign size = DUT.p0.size;
   assign Inst1 = DUT.p0.ctrl.Inst;
   assign memRorW = DUT.p0.memory0.memReadorWrite;
   assign memWrite = DUT.p0.memory0.memWrite;
   assign memRead = DUT.p0.memory0.memRead;
   assign RdD = DUT.p0.memory0.RdD;
   assign aluResult = DUT.p0.memory0.aluResult;
   assign MemData = DUT.p0.memory0.writeData;
   assign memDataIn = DUT.p0.memory0.mem.data_in;
>>>>>>> 22d92accdabc6edd4b2d3168dfe511ab1bdce9fb
   // Data to be written to memory for memory writes (16 bits)
   
   assign halt = DUT.p0.ctrl.halt;
   // Is processor halted (1 bit signal)
   
   /* Add anything else you want here */
   assign WrR = DUT.p0.decode0.WrR;
   assign immpass = DUT.p0.ex.immPass;
   assign doSLBI= DUT.p0.ex.doSLBI;
   assign imm = DUT.p0.ex.imm;
   assign slbiOut = DUT.p0.ex.slbiOut;
   assign rd1 = DUT.p0.ex.rd1;
   assign rd2 = DUT.p0.ex.rd2;
   assign writeregsel = DUT.p0.decode0.regFile0.writeregsel;
   assign write = DUT.p0.decode0.regFile0.write;
   assign invB = DUT.p0.ex.ALUCTRL.invB;
   assign aluOut = DUT.p0.ex.THEALU.Out;
   assign Op = DUT.p0.ex.THEALU.Op;
   assign flag = DUT.p0.ex.flag;
   assign takeBranch = DUT.p0.ex.BRANCHCTRL.takeBranch;
   assign pcNext = DUT.p0.fetch0.pcNext;
   assign memReadorWrite = DUT.p0.memory0.memReadorWrite;
<<<<<<< HEAD
   assign memWrite = DUT.p0.memRead;
   assign memOut = DUT.p0.memory0.rdD;
=======
   assign memOut = DUT.p0.memory0.RdD;
>>>>>>> 22d92accdabc6edd4b2d3168dfe511ab1bdce9fb
   assign CO = DUT.p0.ex.THEALU.CO;
   assign addA = DUT.p0.ex.THEALU.CLA.A;
   assign addB = DUT.p0.ex.THEALU.CLA.B;
   assign addSum = DUT.p0.ex.THEALU.CLA.SUM;
   
endmodule

// DUMMY LINE FOR REV CONTROL :0:
