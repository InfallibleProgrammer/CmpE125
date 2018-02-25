`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2018 07:02:54 PM
// Design Name: 
// Module Name: alu_fpga
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


module alu_fpga(
	input  [3:0] A, 
	input  [3:0] B, 
	input  [2:0] CTRL, 
	output [3:0] OUT, 
	output 		 ZERO, 
	output 		 OVER);

	alu VTR (A, B, CTRL, OUT, ZERO, OVER);

endmodule
