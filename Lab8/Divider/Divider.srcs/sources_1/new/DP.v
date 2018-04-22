`timescale 1ns / 1ps

module DP(
    input [3:0] X,
    input [3:0] Y,
    input [2:0] n,
    input clk,
    input rst,
    input muxstart_sel,
    input muxrem_sel,
    input muxquo_sel,
    input R_LD,
    input R_SL,
    input R_SR,
    input X_LD,
    input X_SL,
    input X_RightIn,
    input Y_LD,
    input count_LD,
    input count_CE,
    output [3:0] R,
    output [3:0] Q,
    output R_lt_Y,
    output cnt_out
    );

    wire [4:0] R_out;
    wire [3:0] X_out;
    wire [3:0] Y_out;
    wire [4:0] sub_out;
    wire [4:0] R_data;
    wire [2:0] count_out;

    mux2 #(5) muxstart(
        .d1  (sub_out),
        .d2  (0),
        .sel (muxstart_sel),
        .y   (R_data)
    );

    shift_register #(5) R_shifter(
        .D       (R_data),
        .LeftIn  (1'b0),
        .RightIn (X_out[3]),
        .LD      (R_LD),
        .SL      (R_SL),
        .SR      (R_SR),
        .RST     (rst),
        .CLK     (clk),
        .Q       (R_out)
    );

    shift_register X_shifter(
        .D       (X),
        .LeftIn  (1'b0),
        .RightIn (X_RightIn),
        .LD      (X_LD),
        .SL      (X_SL),
        .SR      (0),
        .RST     (rst),
        .CLK     (clk),
        .Q       (X_out)
    );

    //making it a ordinary register (disabling shifting)
    shift_register Y_shifter(
        .D       (Y),
        .LeftIn  (1'b0),
        .RightIn (1'b0),
        .LD      (Y_LD),
        .SL      (0),
        .SR      (0),
        .RST     (rst),
        .CLK     (clk),
        .Q       (Y_out)
    );

    comparator comp(
        .a  (R_out),
        .b  ({1'b0, Y_out}),
        .lt (R_lt_Y)
    );

    subtractor sub(
        .a (R_out),
        .b ({1'b0, Y_out}),
        .c (sub_out)
    );

    //only counts down
    ud_counter count(
        .D       (n),
        .LD      (count_LD),
        .UD      (0),
        .CE      (count_CE),
        .RST     (rst),
        .CLK     (clk),
        .Q       (count_out),
        .cnt_out (cnt_out)
    );

    mux2 muxrem(
        .d1  (R_out[3:0]),
        .d2  (0),
        .sel (muxrem_sel),
        .y   (R)
    );

    mux2 muxquo(
        .d1  (X_out),
        .d2  (0),
        .sel (muxquo_sel),
        .y   (Q)
    );



endmodule
