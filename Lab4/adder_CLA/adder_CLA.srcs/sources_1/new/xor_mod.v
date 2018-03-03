`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/01/2018 02:47:48 PM
// Design Name: 
// Module Name: xor_mod
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


module xor_mod(
	input      [3:0] P,
	input      [3:0] C,
	input            C0,
	output reg [3:0] sum,
	output reg       Cout
	);

always@(*)
begin
	sum[0] = P[0] ^ C0;
	sum[1] = P[1] ^ C[0];
	sum[2] = P[2] ^ C[1];
	sum[3] = P[3] ^ C[2];
	Cout   = C[3];
end
endmodule