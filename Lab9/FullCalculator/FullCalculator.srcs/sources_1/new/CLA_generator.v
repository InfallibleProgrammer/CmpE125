`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/01/2018 02:50:50 PM
// Design Name: 
// Module Name: CLA_generator
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


module CLA_generator(
	input       [3:0] P,
	input       [3:0] G,
	input 	          C0,
	output reg  [3:0] C
    );

always@(*)
begin

	C[0] = G[0] | (P[0] & C0);
	C[1] = G[1] | (P[1] & (G[0] | (P[0] & C0)));
	C[2] = G[2] | (P[2] & (G[1] | (P[1] & (G[0] | (P[0] & C0)))));
	C[3] = G[3] | (P[3] & (G[2] | (P[2] & (G[1] | (P[1] & (G[0] | (P[0] & C[0])))))));

end

endmodule