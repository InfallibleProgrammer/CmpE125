`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/28/2018 08:12:29 PM
// Design Name: 
// Module Name: adder
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


module adder(
	input  [3:0] a,
	input  [3:0] b,
	input        Cin,
	output reg [3:0] c,
	output reg     Cout  
    );

	integer sum;

	always@(*)
	begin
		sum = a + b + Cin;
		c = sum[3:0];
		Cout = sum[4];
	end

endmodule
