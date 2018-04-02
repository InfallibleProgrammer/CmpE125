`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2018 07:09:32 PM
// Design Name: 
// Module Name: FIFO_tb
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


module FIFO_tb();

    reg  [3:0] in;
    reg        wnr;
    reg        en;
    reg        clk;
    reg        rst;
    wire [3:0] out;
    wire       full;
    wire       empty;

    integer error = 0;
    integer i_in;

    FIFO DUT(
        .in    (in),
        .wnr   (wnr),
        .en    (en),
        .clk   (clk),
        .rst   (rst),
        .out   (out),
        .full  (full),
        .empty (empty)
    );

    initial begin

        //always enabled
        en = 1;
    
        //reset the DUT
        #5 rst = 1;
        #5 rst = 0;

        clk = 0;

        //check the output flags
        if (!empty)
        begin
            $display("Incorrectly labeled NOT empty.");
            error = error + 1;
        end

        if (full)
        begin
            $display("Incorrectly labeled full.");
            error = error + 1;
        end

        //load the Q
        for (i_in = 0; i_in < 8; i_in = i_in + 1)
        begin
            #5
            //check flags
            if (full)
            begin
                $display("Incorrectly labeled full.");
                error = error + 1;
            end
            else if (!full)
            begin
                wnr = 0;
                //data itself is irrelevant just need to load some data
                in = i_in + 1;
                #1 clk = ~clk;
                #1 clk = ~clk;
            end
            
            //checking partially full/empty
            if (i_in == 4)
            begin
                if(empty)
                begin
                    $display("Incorrectly labeled empty in partially.");
                    error = error + 1;
                end
                if(full)
                begin
                    $display("Incorrectly labeled full in partially.");
                    error = error + 1;
                end
            end
        end

        if (empty)
        begin
            $display("Incorrectly labeled empty.");
            error = error + 1;
        end

        if (!full)
        begin
            $display("Incorrectly labeled NOT full.");
            error = error + 1;
        end


        //pop values out of Q
        for(i_in = 0; i_in < 8; i_in = i_in + 1)
        begin
            #5
            //check flags
            if (empty)
            begin
                $display("Incorrectly labeled empty");
                error = error + 1;
            end
            else if (!empty)
            begin
                wnr = 1;
                #1 clk = ~clk;
                #1 clk = ~clk;
                if ((out != i_in + 1) || (out == 0))
                begin
                    error = error + 1;
                    $display("Data has the incorrect value");
                end
            end

            //checking partially full/empty
            if (i_in == 4)
            begin
                if(empty)
                begin
                    $display("Incorrectly labeled empty in partially.");
                    error = error + 1;
                end
                if(full)
                begin
                    $display("Incorrectly labeled full in partially.");
                    error = error + 1;
                end
            end
        end
        
        //rechecking flags
        if (!empty)
        begin
            $display("Incorrectly labeled NOT empty.");
            error = error + 1;
        end

        if (full)
        begin
            $display("Incorrectly labeled full.");
            error = error + 1;
        end


        if (error == 0)
        begin
            $display("Simulation finished. No errors.");
        end
        else
        begin
            $display("Errors found in simulation: %d", error);
        end

    end

endmodule
