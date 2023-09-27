//********************************************/
/*       Lab01: Up/Down Counter Testbench    */
/*       Jeph Mari M. Daligdig BS ECE IV     */
/*                                           */
/*********************************************/ 

`timescale 1ns/1ps 
module up_down_counter_tb ();

reg clk;
reg rst_n;
reg mode;
reg [7:0] in;

wire [7:0] count;
wire flag;
wire [7:0] flag_count;
wire zero;

initial
begin
clk = 0;
rst_n = 1;
mode = 0;
in = 8'd60;
#2 rst_n = 0;
#17 rst_n = 1;
#1000 mode = 1;
#1500 mode = 0;
#15 rst_n = 1;
#3000 mode = 1;
#3050 rst_n = 0;
#17 rst_n = 0;
#5000 mode = 0;
#6500 $finish;
end

always #10 clk = ~clk;

up_down_counter dut(.clk(clk),
          .rst_n(rst_n),
			 .mode(mode),
			 .in(in),
			 .flag(flag),
			 .flag_count(flag_count),
			 .count(count),
			 .zero(zero));
endmodule
