`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/28/2018 08:12:50 PM
// Design Name: 
// Module Name: tb_adder
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


module tb_adder();

	reg  [3:0] a;
	reg  [3:0] b;
	wire [3:0] c;
	reg 		carryin;
	wire		carryout;

	integer i_a;
	integer i_b;
	integer i_c;
	integer i_carin;
	integer error = 0;

	adder DUT(
		.a (a),
		.b (b),
		.c (c),
		.carryin (carryin),
		.carryout (carryout)
		);

	initial begin
		for(i_a = 0; i_a < 16; i_a = i_a + 1)
		begin
			a = i_a;
	      for(i_carin = 0; i_carin<2; i_carin = i_carin +1)
			begin
				carryin = i_carin;
				for(i_b = 0; i_b < 16; i_b = i_b + 1)
				begin
					b = i_b;
					#5
					i_c = a + b;
					if (i_c != {carryout, c})
					begin
						$display("Error at a: %d b: %d, sum should be: %d, but is %d", a, b, c, i_c);
						error = error + 1;
					end
				end
			end

			if (error == 0)
			begin
				$display("Simulation completed. No errors!");
			end

	end
end
endmodule
