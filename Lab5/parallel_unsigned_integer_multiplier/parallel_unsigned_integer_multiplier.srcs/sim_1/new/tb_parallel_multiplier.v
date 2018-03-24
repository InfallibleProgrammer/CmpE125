`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/08/2018 10:53:42 PM
// Design Name: 
// Module Name: tb_parallel_multiplier
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


module tb_parallel_multiplier();

	reg  [3:0] A;
	reg  [3:0] B;
	wire [7:0] P;

	parallel_multiplier_top DUT(
		.A  (A),
		.B  (B),
		.P  (P)
		);

	integer i_A;
	integer i_B;

	integer tb_P;
	integer error = 0;

	initial begin
		for(i_A = 0; i_A < 16; i_A = i_A + 1)
			begin
				A = i_A;
				for(i_B = 0; i_B < 16; i_B = i_B + 1)
				begin
					B = i_B;
					tb_P = A * B;
					#5
					if (tb_P != P)
					begin
						error = error + 1;
						$display("tb_P = %d AND P = %d", tb_P, P);
						$display("Error count: %d", error);
					end
				end
			end

		if(error == 0)
		begin
			$display("Simulation completed. No errors!");
		end
		if(error != 0)
		begin
			$display("There were %d errors", error);
		end
	end

endmodule
