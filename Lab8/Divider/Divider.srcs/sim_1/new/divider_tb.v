`timescale 1ns / 1ps

module divider_tb();

    reg        Go;
    reg        rst;
    reg        clk;
    reg  [3:0] Dividend;
    reg  [3:0] Divisor;
    wire       Done;
    wire       Err;
    wire [3:0] Quotient;
    wire [3:0] Remainder;
    wire [2:0] CS;

    integer error;
    integer tb_Dividend;
    integer tb_Divisor;
    
    reg [3:0] real_Quotient;
    reg [3:0] real_Remainder;

    task clk_pulse;
        begin
            #5 clk = 1;
            #5 clk = 0;
        end
    endtask

    divider DUT (
        .Go        (Go),
        .rst       (rst),
        .clk       (clk),
        .Dividend  (Dividend),
        .Divisor   (Divisor),
        .Done      (Done),
        .Err       (Err),
        .Quotient  (Quotient),
        .Remainder (Remainder),
        .CS        (CS)
    );

    initial begin

        error = 0;

        for (tb_Dividend = 0; tb_Dividend < 16; tb_Dividend = tb_Dividend + 1)
        begin
            for (tb_Divisor = 0; tb_Divisor < 16; tb_Divisor = tb_Divisor + 1)
            begin
                //reset the DUT
                rst = 1;
                clk_pulse;

                Dividend = tb_Dividend;
                Divisor = tb_Divisor;
                real_Remainder = tb_Dividend % tb_Divisor;
                real_Quotient  = tb_Dividend / tb_Divisor;

                rst = 0;
                Go = 1;
                clk_pulse;
                Go = 0;

                //go through module
                while (!Done)
                begin
                    clk_pulse;
                end

                
                if      ((Divisor == 0) & (!Err)) error = error + 1;
                else if ((Divisor != 0) & (Err))  error = error + 1;
                //we have a true division
                else if (Divisor != 0)
                begin
                    if (real_Remainder != Remainder) error = error + 1;
                    if (real_Quotient != Quotient)   error = error + 1;
                end
            end
        end

        //////////////////
        //Display Errors//
        //////////////////

        if (error == 0) $display("Simulation completed. No errors!");
        else            $display("There are %d errors in simulation.", error);
        $stop;

    end

endmodule
