`timescale 1ns / 1ps

module FSM_DP_tb();

    reg Go;
    reg  [1:0] Op;
    reg  [2:0] In1;
    reg  [2:0] In2;
    reg        clk;
    wire [2:0] CS;
    wire       Done;
    wire [2:0] Out;

    FSM_DP Dut(
        .Go   (Go),
        .Op   (Op),
        .In1  (In1),
        .In2  (In2),
        .clk  (clk),
        .CS   (CS),
        .Done (Done),
        .Out  (Out)
    );

    task clk_pulse;
        begin 
            #5 clk = 1;
            #5 clk = 0;
        end
    endtask

    integer error;
    integer i_Op;
    integer i_In1;
    integer i_In2;

    initial begin
    
        error = 0;

        for (i_In1 = 0; i_In1 < 8; i_In1 = i_In1 + 1)
        begin
            In1 = i_In1;
            for (i_In2 = 0; i_In2 < 8; i_In2 = i_In2 + 1)
            begin
                In2 = i_In2;
                for (i_Op = 0; i_Op < 4; i_Op = i_Op + 1)
                begin
                    Op = i_Op;

                    //tick clock through each state and check for each one
                    //out only available in state 4

                    ///////////
                    //State 0//
                    ///////////
                    Go = 0;
                    clk_pulse;
                    if ((CS != 0) || (Done != 0) || (Out != 0)) error = error + 1;

                    Go = 1;

                    ///////////
                    //State 1//
                    ///////////
                    clk_pulse;
                    if ((CS != 1) || (Done != 0) || (Out != 0)) error = error + 1;

                    ///////////
                    //State 2//
                    ///////////
                    clk_pulse;
                    if ((CS != 2) || (Done != 0) || (Out != 0)) error = error + 1;

                    ///////////
                    //State 3//
                    ///////////
                    clk_pulse;
                    if ((CS != 3) || (Done != 0) || (Out != 0)) error = error + 1;

                    ///////////
                    //State 4//
                    ///////////
                    clk_pulse;
                    if ((CS != 4) || (Done != 1)) error = error + 1;

                    //check Op
                    case (Op)
                        //in1 ^ in2
                        0: if (Out != In1 ^ In2) error = error + 1;
                        //in1 & in2
                        1: if (Out != In1 & In2) error = error + 1;
                        //in1 - in2
                        2: if (Out != In1 - In2) error = error + 1;
                        //in1 + in2
                        3: if (Out != In1 + In2) error = error + 1; 
                    endcase
                
                    ///////////////////
                    //Back to State 0//
                    //////////////////
                    clk_pulse;
                end
            end
        end

        if (error == 0) $display("Simulation Completed. No errors");
        else            $display("Errors found in simulation: %d", error);
        $stop;
    end

endmodule