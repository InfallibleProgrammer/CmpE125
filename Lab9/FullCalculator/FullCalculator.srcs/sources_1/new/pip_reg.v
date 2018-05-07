`timescale 1ns / 1ps

module pip_reg #(parameter WIDTH = 8)(
    input       [WIDTH-1:0]     d,
    input                       clk,
    input                       rst,
    input                       en,
    output reg  [WIDTH-1:0]     q
    );  

always@(posedge clk, posedge rst)
begin
     if(rst) q<= 0;
     else if(en) q[WIDTH-1:0] = d[WIDTH-1:0];
     else q[WIDTH-1:0] <= q[WIDTH-1:0];
end
endmodule
