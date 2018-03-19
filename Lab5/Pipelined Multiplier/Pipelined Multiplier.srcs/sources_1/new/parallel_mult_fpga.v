`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/19/2018 02:40:29 PM
// Design Name: 
// Module Name: parallel_mult_fpga
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


module parallel_mult_fpga(
  input   clk100MHz, 
  input   rst,
  input  [3:0] A, 
  input  [3:0] B,
  input			rst1,
  input			en,
  input			clkbutton,
  output [7:0] LEDSEL, 
  output [7:0] LEDOUT,
  output [3:0] A_led,
  output [3:0] B_led
  );
  
 	assign A_led = A;
 	assign B_led = B;
    wire    [7:0]   product;
    wire            clk_top;
	supply1 [7:0]   vcc;
	wire DONT_USE, clk_5KHz;

	wire [3:0] hundreds;
	wire [3:0] tens;
	wire [3:0] ones;
	wire [7:0] hundreds_led;
	wire [7:0] tens_led;
	wire [7:0] ones_led;

	button_debouncer #(5) CLKButton(
		.clk 				(clk_5KHz),
		.button 			(clkbutton),
		.debounced_button	(clk_top)	
		);

	parallel_multiplier_top PM1(
	.inA     (A),
	.inB     (B),
	.clk    (clk_top),
	.en     (en),
	.rst    (rst1),
	.P      (product)
	);

	split Split(product, ones, tens, hundreds);
	clk_gen clk_gen (clk100MHz, rst, DONT_USE, clk_5KHz);
	bcd_to_7seg Seg100 (hundreds, hundreds_led);
	bcd_to_7seg Seg10(tens, tens_led);
	bcd_to_7seg Seg0(ones, ones_led);
	led_mux LED(clk_5KHz, rst, vcc, vcc, vcc, vcc, vcc, hundreds_led, tens_led, ones_led,
	LEDSEL, LEDOUT); //led_mux object needs to be named
endmodule

`timescale 1ns / 1ps

module split(
  input  wire [7:0] value, 
  output wire [3:0] ones, 
  output wire [3:0] tens,
  output wire [3:0] hundreds
  );
  
  assign ones = value % 10;
  assign tens = (value / 10)%10;
  assign hundreds = value/100;
endmodule

