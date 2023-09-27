//***********************************//
/*        Lab 01: Down Counter       */
/*   Jeph Mari M. Daligdig BS ECE IV */
/*												 */
/*************************************/ 

module counter (clk,
                 rst_n,
					  in,
					  flag,
					  flag_count,
					  count, 
					  zero);
					  
// input declaration

input clk;
input rst_n;
input [7:0] in;

// output declaration

output [7:0] count;
output flag;
output [7:0] flag_count;
output zero;

//data types
wire clk;
wire rst_n;
wire [7:0] in;
wire flag;
wire zero;
wire flag_reset;

reg [7:0] flag_count;
reg [7:0] count;

//Code

always @(posedge clk)
   begin 
	   if (!rst_n)
		   count <= in;
		else 
		   if (zero)
			   count <= in;
			else
			   count <= count - 1;
	end

always @(posedge clk)
   begin 
	   if (!rst_n)
		   flag_count <= 0;
		else 
		   if (flag_reset)
			   flag_count <= 0;
			else
			   flag_count <= flag_count + flag;
	end

assign flag = (count == 8'd5);
assign zero = (count == 8'd0);
assign flag_reset = (flag_count == 8'd100);

endmodule
	