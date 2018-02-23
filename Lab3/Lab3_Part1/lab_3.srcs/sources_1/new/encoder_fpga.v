`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/19/2018 12:15:32 PM
// Design Name: 
// Module Name: encoder_fpga
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


module encoder_fpga (input [7:0] A, output [2:0] LED, output VALID);

   IF_ENC8_3 VTR (A, LED, VALID);

endmodule
