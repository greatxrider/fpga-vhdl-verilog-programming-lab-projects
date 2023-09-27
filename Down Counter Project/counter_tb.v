//***********************************//
/*    Lab 01: Down Counter Testbench */
/*   Jeph Mari M. Daligdig BS ECE IV */
/*												 */
/*************************************/ 

`timescale 1ns/1ps
module counter_tb ();

reg clk;
reg rst_n;
reg [7:0] in;

wire [7:0] count;
wire flag;
wire [7:0] flag_count;
wire zero;

initial
begin
clk = 0;
rst_n = 1;
in = 8'd60;
#2 rst_n = 0;
#17 rst_n = 1;
#2500 rst_n = 0;
#17 rst_n = 1;
#10000 $finish;
end

always #10 clk = ~clk;

counter dut(.clk(clk),
         .rst_n(rst_n),
		   .in(in),
		   .flag(flag),
		   .flag_count(flag_count),
		   .count(count),
		   .zero(zero));
endmodule	