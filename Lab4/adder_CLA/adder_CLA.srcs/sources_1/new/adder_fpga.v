`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2018 11:49:24 PM
// Design Name: 
// Module Name: adder_fpga
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


module adder_fpga(
  input   clk100MHz, 
  input rst,
  input  [3:0] A, 
  input  [3:0] B, 
  input        C0, 
  output [7:0] LEDSEL, 
  output [7:0] LEDOUT,
  output [3:0] A_led,
  output [3:0] B_led
  );
  
  assign A_led = A;
  assign B_led = B;


      supply1 [7:0] vcc;
      wire DONT_USE, clk_5KHz;

      wire [3:0] sum;
      wire Cout;

      wire [3:0] tens;
      wire [3:0] ones;
      wire [7:0] tens_led;
      wire [7:0] ones_led;
      wire [7:0] C0_led;

      adder_CLA_top CLA1(
        .a     (A),
        .b     (B),
        .c0    (C0),
        .sum   (sum),
        .Cout  (Cout)
      );

      split Split({Cout, sum}, ones, tens);
      clk_gen clk_gen (clk100MHz, rst, DONT_USE, clk_5KHz);
      bcd_to_7seg Seg10(tens, tens_led);
      bcd_to_7seg Seg0(ones, ones_led);
      bcd_to_7seg SegC(C0, C0_led);
      led_mux LED(clk_5KHz, rst, C0_led, vcc, vcc, vcc, vcc, vcc, tens_led, ones_led,
      LEDSEL, LEDOUT); //led_mux object needs to be named
endmodule


module split(
  input  wire [4:0] value, 
  output wire [3:0] ones, 
  output wire [3:0] tens
  );
  

  assign ones = value % 10;
  assign tens = value / 10;
  
endmodule