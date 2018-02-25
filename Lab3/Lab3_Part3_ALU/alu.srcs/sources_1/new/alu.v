`timescale 1ns / 1ps


module alu(
	input      [3:0] a, 
	input 	   [3:0] b, 
	input 	   [2:0] ctrl, 
	output reg [3:0] result, 
	output reg		 zero, 
	output reg	 overflow
	);

always@(*)
begin

	overflow = 0;

	case(ctrl)
		3'b100: 
			begin
				result = a - 1;
				overflow = (a == 4'b1111);
			end
		3'b101:
			begin
				result = a + b;
				if ((a[3] == 0) && (b[3] == 0))
				begin
					overflow = (result[3] != 0);
				end
				else if ((a[3] == 1) && (a[3] == 1))
				begin
					overflow = (result[3] != 1);
				end
			end
		3'b110:
			begin
				result = a - b;
				if ((a[3] == 0) && (b[3] == 1))
				begin
					overflow = (result[3] != 0);
				end
				else if ((a[3] == 1) && (a[3] == 0))
				begin
					overflow = (result[3] != 1);
				end
			end
		3'b111: result = a + 1;
		3'b000: result = ~a;
		3'b001: result = a & b;
		3'b010: result = a ^ b;
		3'b011: result = a | b;
	endcase
	
	zero = (result == 4'b0000);

end

endmodule