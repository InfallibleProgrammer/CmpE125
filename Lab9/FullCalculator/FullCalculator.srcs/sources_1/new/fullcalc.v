`timescale 1ns / 1ps

module fullcalc(
    input        Go,
    input        rst,
    input        clk,
    input  [2:0] F,
    input  [3:0] X,
    input  [3:0] Y,
    output       Done,
    output [3:0] Out_H,
    output [3:0] Out_L
    );
    
    DP_fullcalc DP_full (
    
    );
    
    CU_fullcalc CU_full (
    
    );
    
    
endmodule
