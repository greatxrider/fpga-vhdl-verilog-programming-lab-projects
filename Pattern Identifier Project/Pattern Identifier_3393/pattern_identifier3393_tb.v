/********************************************************/
/*																		  */
/*		Lab 4: '3393' Pattern Identifier Testbench        */
/*				Jeph Mari M. Daligdig BS ECE IV             */
/********************************************************/

`timescale 1ns/1ps
module pattern_identifier3393_tb();

reg clk;
reg rst_n;
reg [8:0]data_in;

wire hit;
wire [4:0] state;
wire [4:0] next_state;

initial
begin
   clk = 1;
#2 rst_n = 0;
   data_in = 1;
	rst_n = 1;
#20 data_in = 2;
#20 data_in = 4;
#20 data_in = 2;
#20 data_in = 1;
#20 data_in = 3;
#20 data_in = 2;
#20 data_in = 4;
#20 data_in = 2;
#20 data_in = 3;
#20 data_in = 9;
#20 data_in = 3;
#20 data_in = 1;
#20 data_in = 4;
#20 data_in = 2;
#20 data_in = 2;
#20 data_in = 4;
#20 data_in = 2;
#20 data_in = 3;
#20 data_in = 2;
#20 data_in = 3;
#20 data_in = 6;
#20 data_in = 8;
#20 data_in = 5;
#20 data_in = 3;
#20 data_in = 4;
#20 data_in = 6;
#20 data_in = 9;
#20 data_in = 3;
#20 data_in = 1;
#20 data_in = 2;
#20 data_in = 5;
#20 data_in = 1;
#20 data_in = 2;
#20 data_in = 6;
#20 data_in = 4;
#20 data_in = 2;
end

always #10 clk = ~clk;

pattern_identifier3393 dut(.clk(clk),
									.state(state),
									.data_in(data_in),
									.hit(hit),
									.rst_n(rst_n),
									.next_state(next_state));
endmodule
