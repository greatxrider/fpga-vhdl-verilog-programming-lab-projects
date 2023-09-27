//***********************//
// 3p Vending Machine    //
// Jeph Mari M. Daligdig //
//								 //
//************************/

module vendo_3p (clk,
					rst,
					p1,
					p5,
					disp,
					change,
					cstate);					
	
input clk;
input rst;
input p1;
input p5;

output disp;
output change;
output [2:0] cstate;

wire rst;
wire clk;
wire p1;
wire p5;

reg disp;
reg change;
reg [2:0] cstate;
reg [2:0] nstate;

//State
parameter state_a = 3'b000;
parameter state_b = 3'b001;
parameter state_c = 3'b010;
parameter state_d = 3'b011;
parameter state_e = 3'b100;
parameter state_f = 3'b101;

//State Transition
always @(posedge clk)
		begin
			if (rst)
				cstate <= 3'b000;
			else
				cstate <= nstate;
		end

//Next State statement		
always @(*)
	begin
		case (cstate)
			state_a:
				case({p1,p5})
					2'b10: 	nstate <= state_b;
					2'b01: 	nstate <= state_f;
					default: nstate <= state_a;
				endcase
			state_b:
				case({p1,p5})
					2'b10:	nstate <= state_c;
					2'b01:	nstate <= state_d;
					default:	nstate <= state_b;
				endcase
			state_c:
				case ({p1,p5})
					2'b10:	nstate <= state_a;
					2'b01:	nstate <= state_e;
					default:	nstate <= state_c;
				endcase
			state_d: 		nstate <= state_f;
			state_e: 		nstate <= state_d;
			state_f: 		nstate <= state_a;
			default: nstate <= state_a;
		endcase
	end
//Output Assignment
always @ (posedge clk)
	begin
		case (cstate)
			state_a:
				case({p1,p5})
					2'b01:	begin disp <= 1'b1; change <= 1'b1; end
					2'b10:	begin disp <= 1'b0; change <= 1'b0; end
					default: begin disp <= 1'b0; change <= 1'b0; end
				endcase
			state_b:
				case({p1,p5})
					2'b01:	begin disp <= 1'b1; change <= 1'b1; end
					2'b10:	begin disp <= 1'b0; change <= 1'b0; end
					default: begin disp <= 1'b0; change <= 1'b0; end	
				endcase
			state_c:
				case({p1,p5})
					2'b01:	begin disp <= 1'b1; change <= 1'b1; end
					2'b10:	begin disp <= 1'b1; change <= 1'b0; end
					default	begin disp <= 1'b0; change <= 1'b0; end
				endcase
			state_d:
				begin disp <= 1'b0; change <= 1'b1; end 
			state_e:
				begin disp <= 1'b0; change <= 1'b1; end
			state_f:
				begin disp <= 1'b0; change <= 1'b1; end
		endcase
	end
endmodule 