`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/01/2018 03:14:22 PM
// Design Name: 
// Module Name: adder_CLA_top
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


module adder_CLA_top(
	input  [3:0] a,
	input  [3:0] b,
	input        c0,
	output [3:0] sum,
	output       Cout
    );

	wire [3:0] P;
	wire [3:0] G;
	wire [3:0] C;


	half_adders HA(
		.a (a),
		.b (b),
		.s (P),
		.c (G)
		);

	CLA_generator CLA_G(
		.P  (P), 
		.G  (G), 
		.C0 (c0), 
		.C  (C)
		);

	xor_mod x1(
		.P    (P),
		.C    (C), 
		.C0   (c0), 
		.sum  (sum),
		.Cout (Cout)
		);

endmodule