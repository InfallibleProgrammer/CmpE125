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
	reg 	   Cin;
	wire [3:0] c;
	wire       Cout;

	integer i_a;
	integer i_b;
	integer i_Cin;
	integer tb_sum;
	integer error = 0;

	adder DUT(
		.a    (a),
		.b    (b),
		.Cin  (Cin),
		.c    (c),
		.Cout (Cout)
		);

	initial begin
		for (i_Cin = 0; i_Cin < 2; i_Cin = i_Cin + 1)
		begin
			Cin = i_Cin;
			for(i_a = 0; i_a < 16; i_a = i_a + 1)
			begin
				a = i_a;
				for(i_b = 0; i_b < 16; i_b = i_b + 1)
				begin
					b = i_b;
					tb_sum = a + b + Cin;
					#5
					if (tb_sum != {Cout, c})
					begin
						error = error + 1;
					end
				end
			end
		end

		if (error == 0)
		begin
			$display("Simulation completed. No errors!");
		end

		if (error != 0)
		begin
			$display("Found errors! Error total: %d", error);
		end

	$finish;
	end

endmodule
