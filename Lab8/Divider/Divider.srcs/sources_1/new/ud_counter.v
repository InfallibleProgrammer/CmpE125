`timescale 1ns / 1ps

module ud_counter #(parameter WIDTH = 3)
    (
    input      [WIDTH - 1:0] D,
    input                    LD,
    input                    UD,
    input                    CE,
    input                    RST,
    input                    CLK,
    output reg [WIDTH - 1:0] Q,
    output                   cnt_out
    );

    always @ (posedge CLK, posedge RST)
    begin
        if (RST) Q = 0;
        else
        begin
            if (CE)
            begin
                if (LD) Q = D;
                else
                begin
                    if (UD) Q = Q + 1;
                    else    Q = Q - 1;
                end
            end
            else Q = Q;
        end
    end

    assign cnt_out = (Q == 0) ? 1 : 0;

endmodule
