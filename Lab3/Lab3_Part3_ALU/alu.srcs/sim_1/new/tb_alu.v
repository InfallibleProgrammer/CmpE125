`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2018 07:03:10 PM
// Design Name: 
// Module Name: tb_alu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_alu();

	reg  [3:0] a;
	reg  [3:0] b;
	reg  [2:0] ctrl;
	wire [3:0] result;
	wire       zero;
	wire       overflow;

	reg  [3:0]    tb_result;
	integer       i_ctrl;
	integer 	  i_a;
	integer       i_b;
	integer		  i_overflow;
	integer       i_zero;
	integer       error = 0;

	alu DUT(
		.a        (a)
		.b        (b)
		.ctrl     (ctrl),
		.result   (result)
		.zero     (zero)
		.overflow (overflow)
		);

	initial begin
		for(i_ctrl = 0; i_ctrl < 8; i_ctrl = i_ctrl + 1)
		begin
			ctrl = i_ctrl;
			for(i_a =0; i_a < 16; i_a = i_a + 1)
			begin
				a = i_a;
				#5
				for(i_b =0; i_b < 16; i_b = i_b + 1)
				begin
					b = i_b;
					#5
					case(i_ctrl)
						3'b000: tb_result = ~a;
						3'b001: tb_result = a & b;
						3'b010: tb_result = a ^ b;
						3'b011: tb_result = a | b;
						3'b100:
						begin
							tb_result = a - 1;
							assign i_overflow = (i_a == 15);
						end
						3'b101:
						begin
							tb_result = a + b;
							if ((a[3] == 0) && (b[3] == 0))
							begin
								assign i_overflow = (tb_result[3] != 0);
							end
							else if ((a[3] == 1) && (a[3] == 1))
							begin
								assign i_overflow = (tb_result[3] != 1);
							end
						end
						3'b110:
						begin
							tb_result = a - b;
							if ((a[3] == 0) && (b[3] == 1))
							begin
								assign i_overflow = (tb_result[3] != 0);
							end
							else if ((a[3] == 1) && (a[3] == 0))
							begin
								assign i_overflow = (tb_result[3] != 1);
							end
						end
						3'b111: tb_result = a + 1;
					endcase

					assign i_zero = (tb_result == 4'b0000);

					if (tb_result != result)
					begin
						error = error + 1;
						$display("Error: with inputs %d and %d", a, b);
					end
					if (i_zero != zero)
					begin
						error = error + 1;
						$display("Error: with inputs %d and %d", a, b);
					end
					if (i_overflow != overflow)
					begin
						error = error + 1;
						$display("Error: with inputs %d and %d", a, b);
					end
				end
			end
		end

	$finish;
	end

endmodule