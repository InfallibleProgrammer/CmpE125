`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2018 12:02:08 PM
// Design Name: 
// Module Name: shift_rotator_fpga
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


module shift_rotator_fpga(
	input  [2:0]  SW1, 
	input  [3:0]  SW2, 
	output [3:0]  LED
	);

	shifter_rotator VTR (SW1, SW2, LED);

endmodule
