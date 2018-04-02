`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2018 07:09:00 PM
// Design Name: 
// Module Name: FIFO_fpga
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


module FIFO_fpga(
    input        clk100MHz,
    input        WNR,
    input        EN,
    input        RST,
    input        BUTTON,
    input  [3:0] IN,
    output [3:0] OUT,
    output       EMPTY, 
    output       FULL
    );

    wire debo;
    wire DONT_USE;
    wire clk_5KHz;

    clk_gen clk_g(clk100MHz, RST, DONT_USE, clk_5KHz);

    button_debouncer but(clk_5KHz, BUTTON, debo);

    FIFO Q(
        .in (IN),
        .wnr (WNR),
        .en (EN),
        .clk (debo),
        .rst (RST),
        .out (OUT),
        .full (FULL),
        .empty (EMPTY)
    );

endmodule
