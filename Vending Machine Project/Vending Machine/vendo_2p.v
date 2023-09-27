//**************************//
//    2P Vending Machine    //
//   Jeph Mari M. Daligdig  //
//**************************//


module vendo_2p (clk,
		reset, 
		p1,
		p5,
		disp,
		change,
		cstate
);

//input declaration
input reset;
input clk;
input p1;
input p5;

//output declaration
output disp;
output change;
output [2:0] cstate;

//data types
wire reset;
wire clk;
wire p1;
wire p5;

reg disp;
reg change;
reg [2:0] cstate;
reg [2:0] nstate;

//States
parameter state_A = 3'b000;
parameter state_B = 3'b001;
parameter state_C = 3'b010;
parameter state_D = 3'b011;
parameter state_E = 3'b100;
parameter state_F = 3'b101;

//code begins here
//state Transition
always @ (posedge clk) begin
	if (reset)
		cstate <= 3'b000;
	else
		cstate <= nstate;
	end
//Next State Assignment
	always @ (*) begin
		case (cstate)
			state_A: case({p1,p5})
				2'b01: nstate <= state_B;
				2'b10: nstate <= state_D;
				default: nstate <= state_A;
					endcase
			state_B: case ({p1,p5})
				2'b01: nstate <= state_A;
				2'b10: nstate <= state_C;
				default: nstate <=state_B;
					endcase
			state_C: nstate <= state_D;
			state_D: nstate <= state_E;
			state_E: nstate <= state_F;
			state_F: nstate <= state_A;
			default: nstate <= state_A;
		endcase
		end
//Output assignment
always @ (posedge clk) begin
	case (cstate)
		state_A: case({p1,p5})
			2'b01: begin disp <= 1'b0;
			change <= 1'b0; end
			2'b10: begin disp <= 1'b1;
			change <= 1'b0; end			
			default: begin disp <= 1'b0;
			change <= 1'b0; end
				endcase
		state_B: case({p1,p5})
			2'b01: begin disp <= 1'b1;
			change <= 1'b0; end
			2'b10: begin disp <= 1'b1;
			change <= 1'b0; end
			default: begin disp <= 1'b0;
			change <= 1'b0; end
				endcase
		state_C: begin disp <= 1'b0;
			change <= 1'b1; end
		state_D:	begin disp <= 1'b0;
			change <= 1'b1; end
		state_E: begin disp <= 1'b0;
			change <= 1'b1; end
		state_F:	begin disp <= 1'b0;
			change <= 1'b1; end
	endcase
	end
endmodule
























