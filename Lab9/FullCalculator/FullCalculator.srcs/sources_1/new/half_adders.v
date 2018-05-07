`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/01/2018 01:56:20 PM
// Design Name: 
// Module Name: half_adders
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


module half_adders(
	input  [3:0] a,
	input  [3:0] b,
	output reg [3:0] s,
	output reg [3:0] c
    );

always@(*)
begin

	s[0] = a[0] ^ b[0];
	c[0] = a[0] & b[0];

	s[1] = a[1] ^ b[1];
	c[1] = a[1] & b[1];

	s[2] = a[2] ^ b[2];
	c[2] = a[2] & b[2];

	s[3] = a[3] ^ b[3];
	c[3] = a[3] & b[3];

end
endmodule