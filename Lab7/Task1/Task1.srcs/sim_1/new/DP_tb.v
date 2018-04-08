`timescale 1ns / 1ps

module DP_tb();

    reg [2:0] in1;
    reg [2:0] in2;
    reg [1:0] s1;
    reg [1:0] wa;
    reg [1:0] raa;
    reg [1:0] rab;
    reg [1:0] c;
    reg we;
    reg rea;
    reg reb;
    reg s2;
    reg clk;

    wire [2:0] out;

    task clk_pulse;
        begin
            #1 clk = 1;
            #1 clk = 0;
        end
    endtask

    //instantiate the DP module
    DP DUT(
        .in1 (in1),
        .in2 (in2),
        .s1  (s1),
        .wa  (wa),
        .raa (raa),
        .rab (rab),
        .c   (c),
        .we  (we),
        .rea (rea),
        .reb (reb),
        .s2  (s2),
        .clk (clk),
        .out (out)
    );

    integer i_in1;
    integer i_in2;
    integer error;

    initial begin

        error = 0;

    ////////////////////////////////
    //test 0 output of both muxes//
    ///////////////////////////////
        //mux2
        s2 = 0;
        #5
        if (out != 0)
        begin
            error = error + 1;
            $display("Error at mux2 test. Should be 0 at out. out: %d", out);
        end
        //mux1
        s1 = 2'b01;
        wa = 1;
        we = 1;
        clk_pulse;
        we = 0;
        raa = 1;
        rea = 1;
        clk_pulse;
        c = 2'b00;
        s2 = 1;
        #5
        if (out != 0)
        begin
            error = error + 1;
            $display("Error at mux1 test. Should be 0 at out. out: %d", out);
        end

    /////////////////////////////////
    //writing values to through in1//
    /////////////////////////////////
        s1 = 2'b11;
        we = 1;
        rea = 0;
        reb = 0;
        for (i_in1 = 0; i_in1 < 4; i_in1 = i_in1 + 1)
        begin
            wa = i_in1;
            in1 = i_in1;
            clk_pulse;
        end

    ////////////////////////////////////////////
    //read those values input through in1 back//
    //          using ALU as AND              //
    ////////////////////////////////////////////
        we = 0;
        //because we want to read the data out of regfile now
        s2 = 1;
        c = 2'b10;
        s1 = 2'b11;
        //enable the outputs of regfile
        rea = 1;
        reb = 1;
        for (i_in1 = 0; i_in1 < 4; i_in1 = i_in1 + 1)
        begin
            raa = i_in1;
            rab = i_in1;
            #10
            if (out != i_in1 & i_in1)
            begin
                error = error + 1;
                $display("Error in read values from in1. out: %d", out);
            end
        end
    
    ///////////////////////////////
    //clear out the regfile     //
    //////////////////////////////
        s1 = 2'b11;
        we = 1;
        rea = 0;
        reb = 0;
        for (i_in1 = 0; i_in1 < 4; i_in1 = i_in1 + 1)
        begin
            wa = i_in1;
            in1 = 0;
            clk_pulse;
        end

    ///////////////////////////////
    //writing values through in2//
    //////////////////////////////
        s1 = 2'b10;
        we = 1;
        rea = 0;
        reb = 0;
        for (i_in1 = 0; i_in1 < 4; i_in1 = i_in1 + 1)
        begin
            wa = i_in1;
            in2 = i_in1;
            clk_pulse;
        end

    ////////////////////////////////////////////
    //read those values input through in2 back//
    //            using ALU as ADD           //
    ///////////////////////////////////////////
        we = 0;
        //because we want to read the data out of regfile now
        s2 = 1;
        c = 2'b00;
        s1 = 2'b10;
        //enable the outputs of regfile
        rea = 1;
        reb = 1;
        for (i_in1 = 0; i_in1 < 4; i_in1 = i_in1 + 1)
        begin
            raa = i_in1;
            rab = i_in1;
            #10
            if (out != i_in1 + i_in1)
            begin
                error = error + 1;
                $display("Error in read values from in1. out: %d", out);
            end
        end
        
    ///////////////////////
    //testing subtraction//
    ///////////////////////
        we = 0;
        //because we want to read the data out of regfile now
        s2 = 1;
        c = 2'b01;
        s1 = 2'b10;
        //enable the outputs of regfile
        rea = 1;
        reb = 1;
        for (i_in1 = 0; i_in1 < 3; i_in1 = i_in1 + 1)
        begin
            raa = i_in1 + 1;
            rab = i_in1;
            #10
            if (out != 1)
            begin
                error = error + 1;
                $display("Error in read values from in1. out: %d", out);
            end
        end
        raa = 3;
        rab = 3;
        #10
        if (out != 0)
        begin
            error = error + 1;
            $display("Error in read values from in1. out: %d", out);
        end

    ///////////////////////
    //checking XOR of ALU//
    //////////////////////

    //first we need to load specific values for XOR
    //setting control signals
        s1 = 2'b11;
        we = 1;
        rea = 0;
        reb = 0;
        s2 = 0;

    //writing the values. Will write 0, and 1
    //so that we can properly check XOR
        wa = 0;
        in1 = 1;
        clk_pulse;

        wa = 1;
        clk_pulse;

        wa = 2;
        in1 = 0;
        clk_pulse;

        wa = 3;
        clk_pulse;


    //now check those values
        //seting control signals
        we = 0;
        s2 = 1;
        c = 2'b11;
        //enable the outputs of regfile
        rea = 1;
        reb = 1;

        raa = 0;
        rab = 2;
        #10
        if(out != 1)
        begin
            error = error + 1;
            $display("Error at XOR. Should be 1");
        end
        raa = 1;
        rab = 3;
        #10
        if(out != 1)
        begin
            error = error + 1;
            $display("Error at XOR. Should be 1");
        end

        raa = 0;
        rab = 1;
        #10
        if(out != 0)
        begin
            error = error + 1;
            $display("Error at XOR. Should be 0.");
        end
        raa = 2;
        rab = 3;
        #10
        if(out != 0)
        begin
            error = error + 1;
            $display("Error at XOR. Should be 0.");
        end

    /////////////////////////////////
    //rechecking AND more throughly//
    /////////////////////////////////
        we = 0;
        s2 = 1;
        c = 2'b10;
        //enable the outputs of regfile
        rea = 1;
        reb = 1;

        raa = 0;
        rab = 2;
        #10
        if(out != 0)
        begin
            error = error + 1;
            $display("Error at AND. Should be 0");
        end
        raa = 1;
        rab = 3;
        #10
        if(out != 0)
        begin
            error = error + 1;
            $display("Error at AND. Should be 0");
        end

        raa = 0;
        rab = 1;
        #10
        if(out != 1)
        begin
            error = error + 1;
            $display("Error at AND. Should be 1.");
        end
        raa = 2;
        rab = 3;
        #10
        if(out != 0)
        begin
            error = error + 1;
            $display("Error at AND. Should be 0.");
        end

    /////////////////////
    //Checking feedback//
    ////////////////////

    //to check this we'll write in values
    //use ALU to AND to send feedback back and check
    //the output
        //reg 0,1 are 1 and 2,3 are 0

        //feedback
        we = 0;
        s1 = 2'b00;
        s2 = 1;
        c = 2'b10;

        raa = 0;
        rab = 1;
        #10
        if (out != 1)
        begin
            error = error + 1;
            $display("Error checking feedback step 1");
        end

        raa = 1;
        rab = 2;
        //output from ALU is 0 and is being fedback
        //need that write that to register 1
        wa = 1;
        we = 1;
        clk_pulse;

        //now check AND reg 0 reg 1
        //was 1 now should be 0
        raa = 0;
        rab = 1;
        #10
        if (out != 0)
        begin
            error = error + 1;
            $display("Error checking feedback step 2");
        end

    ////////////////////////
    //final error checking//
    ////////////////////////
        if (error == 0)
            $display("Simulation completed. No errors.");
        else
            $display("Errors found in simulation. Error count: %d", error);
        
        $finish;
    end

endmodule
