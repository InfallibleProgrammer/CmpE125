`timescale 1ns / 1ps

module subtractor #(parameter WIDTH = 5)
    (
    input  [WIDTH - 1:0] a,
    input  [WIDTH - 1:0] b,
    output [WIDTH - 1:0] c
    );

    assign c = a - b;

endmodule
