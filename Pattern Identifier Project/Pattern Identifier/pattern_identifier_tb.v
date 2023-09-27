/********************************************************/
/*																		  */
/*		    	Testbench for patter_identifier             */
/*				Jeph Mari M. Daligdig BS ECE IV             */
/********************************************************/

`timescale 1ns/1ps
module pattern_identifier_tb ();

reg clk;
reg rstn;
reg datain;

wire hit;
wire [8:0] state;
wire [8:0] nstate;


initial
begin
clk = 0;
#2 rstn = 0;
#8 datain = 1;
rstn = 1;
#20 datain = 0;
#20 datain = 1;
#20 datain = 0;
#20 datain = 1;
#20 datain = 0;
#20 datain = 1;
#20 datain = 0;
#20 datain = 1;
#20 datain = 1;
#20 datain = 1;
#20 datain = 0;
#20 datain = 1;
#20 datain = 1;
#20 datain = 0;
#20 datain = 0;
#20 datain = 1;
#20 datain = 1;
#20 datain = 1;
#20 datain = 1;
#20 datain = 0;
#20 datain = 1;
#20 datain = 1;
#20 datain = 0;
#20 datain = 1;
#20 datain = 1;
#20 datain = 0;
#20 datain = 1;
#20 datain = 0;
#20 datain = 1;
#20 datain = 0;
#20 datain = 1;
#20 datain = 0;
#20 datain = 1;
#20 datain = 1;
#20 datain = 1;
#20 datain = 0;
#20 datain = 1;
#20 datain = 1;
#20 datain = 1;
#20 datain = 1;
#20 datain = 1;
#20 datain = 1;
#20 datain = 0;
#20 datain = 1;
#20 datain = 1;
#20 datain = 0;
#20 datain = 0;
#20 datain = 0;
#20 datain = 1;
#20 datain = 1;
#20 $finish;
end

always #10 clk = ~clk;

pattern_identifier	dut(.clk(clk),
									.state(state),
									.datain(datain),
									.hit(hit),
									.rstn(rstn),
									.nstate(nstate)); 

endmodule