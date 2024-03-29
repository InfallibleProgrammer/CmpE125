`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2018 12:37:06 PM
// Design Name: 
// Module Name: pe_casez
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






module CASEZ_ENC8_3 (input [7:0] A,output reg [2:0] Y, output reg Valid);

always @ (A)
begin
  Valid = 1;
  casez (A)
    8'b 1???????: Y = 7;
    8'b 01??????: Y = 6;
    8'b 001?????: Y = 5;
    8'b 0001????: Y = 4;
    8'b 00001???: Y = 3;
    8'b 000001??: Y = 2;
    8'b 0000001?: Y = 1;
    8'b 00000001: Y = 0;
    default:

    begin
      Valid = 0;
      Y = 3'b?;
    end
  endcase
end
endmodule
