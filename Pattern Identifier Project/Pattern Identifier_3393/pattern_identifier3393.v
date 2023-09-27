/********************************************************/
/*																		  */
/*			Lab 4: '3393' Pattern Identifier               */
/*				Jeph Mari M. Daligdig BS ECE IV             */
/********************************************************/

module pattern_identifier3393(clk,
                          state,
								  data_in,
								  hit,
								  rst_n,
								  next_state);
//Input declarations
input clk;
input [8:0] data_in;
input rst_n;

//Output declarations
output hit;	
output [4:0] state;
output [4:0] next_state;

//Data Types
wire clk;
wire rst_n;
wire [8:0] data_in;
reg [4:0] next_state;
reg [4:0] state;
reg hit;

//Parametric values
parameter [8:0] idle = 9'd0;
parameter [8:0] state1 = 9'd1;
parameter [8:0] state2 = 9'd2;
parameter [8:0] state3 = 9'd3;
parameter [8:0] target = 9'd4;

//Combinational section
always @ (*)
   begin
	   case (state)
		   idle  : if (data_in == 3)
			         begin
						   next_state <= state1;
						end
						else
						begin
						   next_state <= idle;
						end
			state1:  if (data_in == 3)
			         begin
						   next_state <= state2;
						end
						else
						   begin
							   next_state <= state1;
							end
			state2:  if (data_in == 9)
						begin
						   next_state <= state3;
						end
						else
						   if (data_in == 3)
							begin
							   next_state <= state1;
							end
							else
							   if (data_in == 3)
							    begin 
								    next_state <= state2;
								 end
								 else
								 begin
								    next_state <= idle;
								 end
		   state3:  if (data_in == 3)
		            begin 
					      next_state <= target;
						end
					   else
					      if (data_in == 3)	
							begin
							   next_state <= state1;
							end
							else
							   if (data_in == 3)
								begin
								   next_state <= state2;
								end
								else
								   if (data_in == 9)
									begin 
									   next_state <= state3;
									end 
									else
									begin
									   next_state <= idle;
									end
			target:  if (data_in == 3)
							begin 
							    next_state <= state1;
						   end
					   else
						   begin
							next_state <= idle;
							end
			default: next_state <= idle;
		endcase
	end
//Sequential Section of FSM Specifying the value of 'state'
always @ (posedge clk)
begin
   if (!rst_n)
	   state <= idle;
	else
	   state <= next_state;
end

//Hit is enabled when 'target' state is reached
always @ (*)
begin
   case (state)
	   idle  : hit = 1'b0;
		state1: hit = 1'b0;
		state2: hit = 1'b0;
		state3: hit = 1'b0;
		target: hit = 1'b1;
		default:hit = 1'b0;
	endcase
end
endmodule
