/********************************************************/
/*																		  */
/*			Lab 4: 8-bit Pattern Identifier 11101100       */
/*				Jeph Mari M. Daligdig BS ECE IV             */
/********************************************************/

module pattern_identifier (clk,
                           state, 
									datain, 
									hit, 
									rstn, 
									nstate);

// input declaration
input clk;
input datain;
input rstn;

//output declaration
output hit;
output [8:0] state;
output [8:0] nstate;

//data types
wire clk;
wire rstn;
wire datain;
reg [8:0] nstate;
reg [8:0] state;
reg hit;

//parametric values for different states of the FSM
// one hot encoding is used
parameter [8:0] idle = 9'd1;
parameter [8:0] state1 = 9'd2;
parameter [8:0] state2 = 9'd4;
parameter [8:0] state3 = 9'd8;
parameter [8:0] state4 = 9'd16;
parameter [8:0] state5 = 9'd32;
parameter [8:0] state6 = 9'd64;
parameter [8:0] state7 = 9'd128;
parameter [8:0] target = 9'd256;

//Combinational section of FSM
always @(*)
begin
case(state)
	idle : if (datain == 1)
		begin
			nstate = state1;
		end
	else
		begin
			nstate = idle;
		end
	state1: if (datain == 1)
		begin
			nstate = state2;
		end
	else
		begin
			nstate = idle;
		end
	state2 : if (datain == 1)
		begin
			nstate = state3;
		end
	else
		begin
			nstate = idle;
		end
	state3 : if (datain == 0)
		begin
			nstate = state4;
		end
	else
		begin
			nstate = idle;
		end 
	state4 : if (datain == 1)
		begin
			nstate = state5;
		end
	else
		begin
			nstate = idle;
		end
	state5 : if (datain == 1)
		begin
			nstate = state6;
		end
	else
		begin
			nstate = idle;
		end
	state6 : if (datain == 0)
		begin
			nstate = state7;
		end
	else
		begin
			nstate = state3;
		end
	state7 : if (datain == 0)
		begin
			nstate = target;
		end
	else
		begin
			nstate = state1;
		end
	target : if (datain == 0)
		begin
			nstate = idle;
		end
	else
		begin
			nstate = state1;
		end

	default : nstate = idle;
endcase
end

//Sequential section of FSM specifying the value of 'state'
always @(posedge clk)
begin
	if (!rstn)
		state <= idle;
	else
		state <= nstate; 
end

//Hit is enabled when 'target' state is reached
always @(*)
begin
	case (state)
		idle : hit = 1'h0;
		state1 : hit = 1'h0;
		state2 : hit = 1'h0;	
		state3 : hit = 1'h0;
		state4 : hit = 1'h0;
		state5 : hit = 1'h0;
		state6 : hit = 1'h0;
		state7 : hit = 1'h0;
		target: hit = 1'h1;
		default : hit = 1'h0;
	endcase

end


endmodule
