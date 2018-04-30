`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/30/2018 10:22:35 AM
// Design Name: 
// Module Name: divider_fpga
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


module divider_fpga(
    input        Go,
    input        rst,
    input        clk100MHz,
    input        BUTTON,
    input  [3:0] Dividend,
    input  [3:0] Divisor,
    output       Done
    );
    supply1 [7:0] vcc;
    wire DONT_USE;
    wire clk_5KHz;
    wire debo;

    wire [3:0] Quotient;
    wire [3:0] Remainder;
    wire [2:0] CS;
    
    wire [7:0] cs_led;
    wire [7:0] Q_led;
    wire [7:0] R_led;
    clk_gen clk_g(clk100MHz, rst, DONE_USE, clk_5KHz);   
    button_debouncer but(clk_5KHz, BUTTON, debo);
    divider d(
    .Go         (Go),
    .rst        (rst),
    .clk        (debo),
    .Dividend   (Dividend),
    .Divisor    (Divisor),
    .Done       (Done),
    .CS         (CS),
    .Quotient   (Quotient),
    .Remainder  (Remainder)
    );
    bcd_to_7seg(Quotient, Q_led);
    bcd_to_7seg(Remainder, R_led);
    led_mux LED(clk_5KHz, rst, vcc, vcc, vcc, cs_led, vcc, vcc, vcc, out_led,
    LEDSEL, LEDOUT);

endmodule
