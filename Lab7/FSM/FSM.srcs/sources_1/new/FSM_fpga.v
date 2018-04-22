`timescale 1ns / 1ps


module FSM_fpga(
    input        GO,
    input [1:0]  OP,
    input [2:0]  IN1,
    input [2:0]  IN2,
    input        BUTTON,
    input        clk100MHz,
    input        rst,
    output       DONE,
    output [7:0] LEDSEL, 
    output [7:0] LEDOUT
);

    //temp

    wire DONT_USE;
    wire clk_5KHz;
    wire debo;

    wire [2:0] cs;
    wire [2:0] out;

    wire [7:0] cs_led;
    wire [7:0] out_led;

    supply1 [7:0] vcc;

    clk_gen clk_g(clk100MHz, rst, DONE_USE, clk_5KHz);

    button_debouncer but(clk_5KHz, BUTTON, debo);

    FSM_DP FSMDP(
        .Go (GO),
        .Op (OP),
        .In1 (IN1),
        .In2 (IN2),
        .clk (debo),
        .CS (cs),
        .Done (DONE),
        .Out (out)
    );

    bcd_to_7seg SegCS(cs, cs_led);
    bcd_to_7seg SegOUT(out, out_led);

    led_mux LED(clk_5KHz, rst, cs_led, vcc, vcc, vcc, vcc, vcc, vcc, out_led,
    LEDSEL, LEDOUT);

endmodule
