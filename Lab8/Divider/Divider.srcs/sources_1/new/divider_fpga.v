`timescale 1ns / 1ps

module divider_fpga(
    input        Go,
    input        rst,
    input        clk100MHz,
    input        BUTTON,
    input  [3:0] Dividend,
    input  [3:0] Divisor,
    output       Done,
    output       Err,
    output [7:0] LEDSEL,
    output [7:0] LEDOUT
    );
    supply1 [7:0] vcc;
    wire DONT_USE;
    wire clk_5KHz;
    wire debo;

    wire [3:0] Quotient;
    wire [3:0] Remainder;
    wire [2:0] CS;
    wire [3:0] onesR;
    wire [3:0] tensR;
    wire [7:0] Q_led;
    wire [7:0] Q_led1;
    wire [7:0] R_led;
    wire [7:0] R_led1;
    clk_gen clk_g(clk100MHz, rst, DONE_USE, clk_5KHz);   
    button_debouncer but(clk_5KHz, BUTTON, debo);
    divider d(
    .Go         (Go),
    .rst        (rst),
    .clk        (debo),
    .Dividend   (Dividend),
    .Divisor    (Divisor),
    .Done       (Done),
    .Err        (Err),
    .CS         (CS),
    .Quotient   (Quotient),
    .Remainder  (Remainder)
    );
    
    split s(
    .value (Remainder),
    .ones (onesR),
    .tens (tensR)
    );
    split s1(
    .value (Quotient),
    .ones (onesQ),
    .tens (tensQ)
    );
    bcd_to_7seg(onesQ, Q_led1);
    bcd_to_7seg(tensQ, Q_led);
    bcd_to_7seg(tensR, R_led);
    bcd_to_7seg(onesR, R_led1);
    led_mux LED(clk_5KHz, rst, vcc, vcc, Q_led, Q_led1, vcc, vcc, R_led, R_led1,
    LEDSEL, LEDOUT);

endmodule

module split(
  input  wire [3:0] value, 
  output wire [3:0] ones, 
  output wire [3:0] tens
  );
  
  assign ones = value % 10;
  assign tens = (value / 10)%10;
endmodule