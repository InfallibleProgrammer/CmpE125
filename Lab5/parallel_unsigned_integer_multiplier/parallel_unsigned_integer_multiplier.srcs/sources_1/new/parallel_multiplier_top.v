`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/08/2018 10:21:53 PM
// Design Name: 
// Module Name: parallel_multiplier_top
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


module parallel_multiplier_top(
	input  [3:0] A,
	input  [3:0] B,
	output [7:0] P
    );

	wire [3:0] PP3;
	wire [3:0] PP1;
	wire [3:0] PP2;
	wire [3:0] PP0;

	wire [7:0] PP0_PP1;
	wire [7:0] PP2_PP3;

	wire temp;
	
	and_mod AND_MOD3(
		.A (A),
		.B (B[3]),
		.Y (PP3)
		);

	and_mod AND_MOD2(
		.A (A),
		.B (B[2]),
		.Y (PP2)
		);

	and_mod AND_MOD1(
		.A (A),
		.B (B[1]),
		.Y (PP1)
		);
	
	and_mod AND_MOD0(
		.A (A),
		.B (B[0]),
		.Y (PP0)
		);

	adder_8bit PP0_1(
		.A ({4'b0000, PP0}),
		.B ({3'b000, PP1, 1'b0}),
		.Cin (0),
		.sum (PP0_PP1),
		.Cout (temp)
		);

	adder_8bit PP2_3(
		.A ({2'b00, PP2, 2'b00}),
		.B ({1'b0, PP3, 3'b000}),
		.Cin (0),
		.sum (PP2_PP3),
		.Cout (temp)
		);

	adder_8bit PP_FINAL(
		.A (PP0_PP1),
		.B (PP2_PP3),
		.Cin (0),
		.sum (P),
		.Cout (temp)
		);

endmodule
