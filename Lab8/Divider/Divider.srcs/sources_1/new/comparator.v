`timescale 1ns / 1ps

module comparator #(parameter WIDTH = 5)
    (
    input  [WIDTH - 1:0] a,
    input  [WIDTH - 1:0] b,
    output               lt,
    output               zero
    );

    assign lt   = (a < b)  ? 1 : 0;
    assign zero = (b == 0) ? 1 : 0;

endmodule
