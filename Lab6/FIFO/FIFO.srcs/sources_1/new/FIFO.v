`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2018 06:29:06 PM
// Design Name: 
// Module Name: FIFO
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module FIFO(
    input      [3:0] in,
    input            wnr,
    input            en,
    input            clk,
    input            rst,
    output reg [3:0] out,
    output reg       full,
    output reg       empty
    );

    reg [3:0] Q [7:0];
    reg [3:0] r_ptr;
    reg [3:0] w_ptr;

    //always block for the Q itself
    always@(posedge clk, posedge rst)
    begin
        //if reset then out set to 0
        if(rst)
        begin
            r_ptr = 0;
            w_ptr = 0;
            out = 0;
        end
        //no enabled so high Z out
        else if (!en)
        begin
            out = 'bZ;
        end
        //read operation
        else if(wnr && !empty)
        begin
            out = Q[r_ptr[3:0]];
            r_ptr = r_ptr + 1;
        end
        //write operation
        else if (!wnr && !full)
        begin
            Q[w_ptr[3:0]] = in;
            w_ptr = w_ptr + 1;
        end
        //shouldn't get here
        else
        begin
            out = 'bZ;
        end

    end

    //check the read and write pointers
    always@(w_ptr, r_ptr)
    begin
        if (r_ptr == w_ptr)
        begin
            empty = 1;
            full = 0;
        end
        else if (r_ptr[2:0] == w_ptr[2:0])
        begin
            empty = 0;
            full = 1;
        end
        else
        begin
            empty = 0;
            full = 0;
        end
    end

endmodule
