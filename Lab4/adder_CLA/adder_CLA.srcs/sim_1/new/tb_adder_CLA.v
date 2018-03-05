`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/01/2018 09:17:30 PM
// Design Name: 
// Module Name: tb_adder_CLA
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


module tb_adder_CLA();

	reg  [3:0] a;
	reg  [3:0] b;
	reg 	   c0;
	wire [3:0] sum;
	wire       Cout;

	adder_CLA_top DUT(
		.a    (a),
		.b    (b),
		.c0   (c0),
		.sum  (sum),
		.Cout (Cout)
		);

	integer i_a;
	integer i_b;
	integer i_c0;

	integer tb_sum;
	integer error = 0;
	integer error_value = 0;

	initial begin
		for(i_c0 = 0; i_c0 < 2; i_c0 = i_c0 + 1)
		begin
			c0 = i_c0;
			for(i_a = 0; i_a < 16; i_a = i_a + 1)
			begin
				a = i_a;
				for(i_b = 0; i_b < 16; i_b = i_b + 1)
				begin
					b = i_b;
					tb_sum = a + b + c0;
					#5
					if (tb_sum != {Cout, sum})
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

   	if(error != 0)
   	begin
       $display("There were %d errors", error);
   	end
   $display("I got here");
end
endmodule
