`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2018 12:39:19 PM
// Design Name: 
// Module Name: adder_8bit
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


module adder_8bit(
	input [7:0] A,
	input [7:0] B,
	input Cin,
	output [7:0] sum,
	output Cout
    );
	
	wire carry;
	adder_CLA_top LOWER(
		.a    (A[3:0]),
		.b    (B[3:0]),
		.c0   (Cin),
		.sum  (sum[3:0]),
		.Cout (carry)
		);

	adder_CLA_top UPPER(
		.a    (A[7:4]),
		.b    (B[7:4]),
		.c0   (carry),
		.sum  (sum[7:4]),
		.Cout (Cout)
		);

endmodule
