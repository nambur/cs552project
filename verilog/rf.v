
module rf (read1data, read2data, err,clk, rst, read1regsel, read2regsel, writeregsel, writedata, write);
   input clk, rst;
   input [2:0] read1regsel;
   input [2:0] read2regsel;
   input [2:0] writeregsel;
   input [15:0] writedata;
   input        write;

   output [15:0] read1data;
   output [15:0] read2data;
   output        err;

   // your code
   wire [15:0] regOut0,regOut1,regOut2,regOut3,regOut4,regOut5,regOut6,regOut7;
   wire [7:0] regSel,regS;
   wire [127:0] muxIn;

   //Instantiate 16-bit registers
   reg16bit reg0(.clk(clk),.rst(rst),.en(regSel[0]),.in(writedata),.out(regOut0));
   reg16bit reg1(.clk(clk),.rst(rst),.en(regSel[1]),.in(writedata),.out(regOut1));
   reg16bit reg2(.clk(clk),.rst(rst),.en(regSel[2]),.in(writedata),.out(regOut2));
   reg16bit reg3(.clk(clk),.rst(rst),.en(regSel[3]),.in(writedata),.out(regOut3));
   reg16bit reg4(.clk(clk),.rst(rst),.en(regSel[4]),.in(writedata),.out(regOut4));
   reg16bit reg5(.clk(clk),.rst(rst),.en(regSel[5]),.in(writedata),.out(regOut5));
   reg16bit reg6(.clk(clk),.rst(rst),.en(regSel[6]),.in(writedata),.out(regOut6));
   reg16bit reg7(.clk(clk),.rst(rst),.en(regSel[7]),.in(writedata),.out(regOut7));
   
   //Read [input] logic
   decode3to8 decode0(.in(writeregsel),.out(regS));
   
   //Enable logic
   assign regSel[0] = (regS[0] & write);
   assign regSel[1] = (regS[1] & write);
   assign regSel[2] = (regS[2] & write);
   assign regSel[3] = (regS[3] & write);
   assign regSel[4] = (regS[4] & write);
   assign regSel[5] = (regS[5] & write);
   assign regSel[6] = (regS[6] & write);
   assign regSel[7] = (regS[7] & write);
   
   //Read [output] logic
   assign muxIn = {regOut7,regOut6,regOut5,regOut4,regOut3,regOut2,regOut1,regOut0};
   b16mux8_1 mux0(.in(muxIn),.s(read1regsel),.out(read1data));
   b16mux8_1 mux1(.in(muxIn),.s(read2regsel),.out(read2data));	
   

endmodule
// DUMMY LINE FOR REV CONTROL :1:
