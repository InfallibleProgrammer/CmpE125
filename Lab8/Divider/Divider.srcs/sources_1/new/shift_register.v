`timescale 1ns / 1ps

module shift_register #(parameter WIDTH = 4)
    (
    input      [WIDTH - 1:0] D,
    input                    LeftIn,
    input                    RightIn,
    input                    LD,
    input                    SL,
    input                    SR,
    input                    RST,
    input                    CLK,
    output reg [WIDTH - 1:0] Q
    );

    always @ (posedge CLK, posedge RST)
    begin
        if (RST) Q = 0;
        else
        begin
            if      (LD) Q = D;
            else if (SL)
            begin
                        Q[WIDTH - 1:1] = Q[WIDTH - 2:0];
                        Q[0] = RightIn;
            end
            else if (SR) 
            begin
                        Q[WIDTH - 2:0] = Q[WIDTH - 1:1];
                        Q[WIDTH - 1] = LeftIn;
            end
            else        Q = Q;
        end
    end

endmodule
