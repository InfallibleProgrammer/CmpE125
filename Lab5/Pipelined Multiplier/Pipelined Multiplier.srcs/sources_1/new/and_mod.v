`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/08/2018 10:01:42 PM
// Design Name: 
// Module Name: and_mod
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


module and_mod(
	input  [3:0] A,
	input        B,
	output [3:0] Y
    );

	assign Y[0] = B & A[0];
	assign Y[1] = B & A[1];
	assign Y[2] = B & A[2];
	assign Y[3] = B & A[3];

endmodule
