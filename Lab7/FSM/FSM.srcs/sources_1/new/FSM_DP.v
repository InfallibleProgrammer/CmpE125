`timescale 1ns / 1ps

module FSM_DP(
    input        Go,
    input  [1:0] Op,
    input  [2:0] In1,
    input  [2:0] In2,
    input        clk,
    output [2:0] CS,
    output       Done,
    output [2:0] Out
);

    wire [1:0] s1;
    wire [1:0] wa;
    wire       we;
    wire [1:0] raa;
    wire       rea;
    wire [1:0] rab;
    wire       reb;
    wire [1:0] c;
    wire       s2;

    FSM CU(
        .Go   (Go),
        .Op   (Op),
        .clk  (clk),
        .s1   (s1),
        .wa   (wa),
        .we   (we),
        .raa  (raa),
        .rea  (rea),
        .rab  (rab),
        .reb  (reb),
        .c    (c),
        .s2   (s2),
        .CS   (CS),
        .Done (Done)
    );

    DP data_path(
        .in1 (In1),
        .in2 (In2),
        .s1  (s1),
        .clk (clk),
        .wa  (wa),
        .we  (we),
        .raa (raa),
        .rea (rea),
        .rab (rab),
        .reb (reb),
        .c   (c),
        .s2  (s2),
        .out (Out)
    );

endmodule