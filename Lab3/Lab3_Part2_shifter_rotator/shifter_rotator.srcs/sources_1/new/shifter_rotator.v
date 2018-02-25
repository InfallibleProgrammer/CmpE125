`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/20/2018 05:23:31 PM
// Design Name: 
// Module Name: shifter_rotator
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


module shifter_rotator(
    input      [2:0] ctrl_in, 
    input      [3:0] data_in, 
    output reg [3:0] data_out
    );

always@(data_in, ctrl_in)
begin

    case(ctrl_in)
    	0: data_out = data_in;
    	1: data_out = {1'b0 , data_in[3:1]};
    	2: data_out = {2'b00, data_in[3:2]};
    	3: data_out = {3'b000, data_in[3]};
    	4: data_out = 4'b0000;
    	5: data_out = {data_in[0], data_in[3:1]};
    	6: data_out = {data_in[1:0], data_in[3:2]};
    	7: data_out = {data_in[2:0], data_in[3]};
    endcase

end

endmodule