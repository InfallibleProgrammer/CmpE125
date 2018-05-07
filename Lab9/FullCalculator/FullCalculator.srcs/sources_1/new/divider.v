`timescale 1ns / 1ps

module divider(
    input        Go,
    input        rst,
    input        clk,
    input  [3:0] Dividend,
    input  [3:0] Divisor,
    output       Done,
    output       Err,
    output [3:0] Quotient,
    output [3:0] Remainder,
    output [2:0] CS
    );

    wire muxstart_sel;
    wire muxrem_sel;
    wire muxquo_sel;
    wire R_LD;
    wire R_SL;
    wire R_SR;
    wire X_LD;
    wire X_SL;
    wire X_RightIn;
    wire Y_LD;
    wire count_LD;
    wire count_CE;

    wire R_lt_Y;
    wire cnt_out;
    wire DBZ;


    DP data_path (
        .X            (Dividend),
        .Y            (Divisor),
        .n            (4),
        .clk          (clk),
        .rst          (rst),
        .muxstart_sel (muxstart_sel),
        .muxrem_sel   (muxrem_sel),
        .muxquo_sel   (muxquo_sel),
        .R_LD         (R_LD),
        .R_SL         (R_SL),
        .R_SR         (R_SR),
        .X_LD         (X_LD),
        .X_SL         (X_SL),
        .X_RightIn    (X_RightIn),
        .Y_LD         (Y_LD),
        .count_LD     (count_LD),
        .count_CE     (count_CE),
        .DBZ          (DBZ),
        .R            (Remainder),
        .Q            (Quotient),
        .R_lt_Y       (R_lt_Y),
        .cnt_out      (cnt_out)
        );

    CU control (
        .Go           (Go),
        .clk          (clk),
        .rst          (rst),
        .R_lt_Y       (R_lt_Y),
        .cnt_out      (cnt_out),
        .DBZ          (DBZ),
        .muxstart_sel (muxstart_sel),
        .muxrem_sel   (muxrem_sel),
        .muxquo_sel   (muxquo_sel),
        .R_LD         (R_LD),
        .R_SL         (R_SL),
        .R_SR         (R_SR),
        .X_LD         (X_LD),
        .X_SL         (X_SL),
        .X_RightIn    (X_RightIn),
        .Y_LD         (Y_LD),
        .count_LD     (count_LD),
        .count_CE     (count_CE),
        .Done         (Done),
        .Err          (Err),
        .CS           (CS)
    );

endmodule
