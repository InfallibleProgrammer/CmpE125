`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2018 07:03:36 PM
// Design Name: 
// Module Name: debounce2
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


module button_debouncer #(parameter depth = 16) (
    input wire clk,                 /* 5 KHz clock */
    input wire button,              /* Input button from constraints */
    output reg debounced_button
    );
    
    localparam history_max = (2**depth)-1;

    /* History of sampled input button */
    reg [depth-1:0] history;

    always @ (posedge clk)
    begin
        /* Move history back one sample and insert new sample */
        history <= { button, history[depth-1:1] };
        
        /* Assert debounced button if it has been in a consistent state throughout history */
        debounced_button <= (history == history_max) ? 1'b1 : 1'b0;
    end
endmodule
