
/* $Author: karu $ */
/* $LastChangedDate: 2009-03-04 23:09:45 -0600 (Wed, 04 Mar 2009) $ */
/* $Rev: 45 $ */
module rf_bypass (
           // Outputs
           read1data, read2data, err,
           // Inputs
           clk, rst, read1regsel, read2regsel, writeregsel, writedata, write
           );
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

   wire [15:0] out1data,out2data;
   wire mux1sel,mux2sel;
	
	//Instantiate register file
	rf reg0(.read1data(out1data),.read2data(out2data),.err(err),.clk(clk),.rst(rst),
		.read1regsel(read1regsel),.read2regsel(read2regsel),.writeregsel(writeregsel)
		,.writedata(writedata),.write(write));

	
	//Mux select logic
	assign mux1sel = (write&(writeregsel==read1regsel));
	assign mux2sel = (write&(writeregsel==read2regsel));

	//Bypass logic
	assign read1data = mux1sel ? writedata : out1data;
	assign read2data = mux2sel ? writedata : out2data;

endmodule
// DUMMY LINE FOR REV CONTROL :1:
