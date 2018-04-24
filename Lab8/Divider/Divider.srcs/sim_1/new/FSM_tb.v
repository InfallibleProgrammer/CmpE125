`timescale 1ns / 1ps

module FSM_tb();

    reg  Go;
    reg  clk;
    reg  rst;
    reg  R_lt_Y;
    reg  cnt_out;
    reg  zero;
    wire muxstart_sel;
    wire muxrem_sel;
    wire muxquo_sel;
    wire R_LD;
    wire R_SL;
    wire R_SR;
    wire X_LD;
    wire X_SL;
    wire X_RightIn;
    wire Y_LD;
    wire count_LD;
    wire count_CE;
    wire Done;
    wire Err;

    CU DUT(
        .Go           (Go),
        .clk          (clk),
        .rst          (rst),
        .R_lt_Y       (R_lt_Y),
        .cnt_out      (cnt_out),
        .zero         (zero),
        .muxstart_sel (muxstart_sel),
        .muxrem_sel   (muxrem_sel),
        .muxquo_sel   (muxquo_sel),
        .R_LD         (R_LD),
        .R_SL         (R_SL),
        .R_SR         (R_SR),
        .X_LD         (X_LD),
        .X_SL         (X_SL),
        .X_RightIn    (X_RightIn),
        .Y_LD         (Y_LD),
        .count_LD     (count_LD),
        .count_CE     (count_CE),
        .Done         (Done),
        .Err          (Err)
    );

    parameter DBZ  = 14'b_0_0_0_0_0_0_0_0_0_0_0_0_0_1,
              out0  = 14'b_0_0_0_0_0_0_0_0_0_0_0_0_0_0,
              out1  = 14'b_1_0_0_1_0_0_1_0_0_1_1_0_0_0,
              out2  = 14'b_0_0_0_0_1_0_0_1_0_0_0_0_0_0,
              out3a = 14'b_1_0_0_1_0_0_0_0_0_0_0_1_0_0,
              out3b = 14'b_0_0_0_0_0_0_0_0_0_0_0_1_0_0,
              out4  = 14'b_0_0_0_0_1_0_0_1_1_0_1_0_0_0,
              out5  = 14'b_0_0_0_0_1_0_0_1_0_0_1_0_0_0,
              out6  = 14'b_0_0_0_0_0_1_0_0_0_0_0_0_0_0,
              out7  = 14'b_0_1_1_0_0_0_0_0_0_0_0_0_1_0;

    task clk_pulse;
        begin
            #5 clk = 1;
            #5 clk = 0;
        end
    endtask

    integer wrong;

    initial begin

        wrong = 0;

        rst = 0;
        R_lt_Y = 0;
        Go = 0;
        cnt_out = 0;
        zero = 0;

        clk_pulse;

        ////////////
        //State 0//
        ///////////
        if ({muxstart_sel, muxrem_sel, muxquo_sel, 
        R_LD, R_SL, R_SR, X_LD, X_SL, X_RightIn,
        Y_LD, count_LD, count_CE, Done, Err}        != out0) wrong = wrong + 1;


        ////////////
        //State 1//
        ///////////
        rst = 0;
        R_lt_Y = 0;
        Go = 1;
        cnt_out = 0;
        zero = 0;

        clk_pulse;

        if ({muxstart_sel, muxrem_sel, muxquo_sel, 
        R_LD, R_SL, R_SR, X_LD, X_SL, X_RightIn,
        Y_LD, count_LD, count_CE, Done, Err}        != out1) wrong = wrong + 1;
       
        ////////////
        //State 2//
        ///////////
        rst = 0;
        R_lt_Y = 0;
        Go = 0;
        cnt_out = 0;
        zero = 0;

        clk_pulse;

        if ({muxstart_sel, muxrem_sel, muxquo_sel, 
        R_LD, R_SL, R_SR, X_LD, X_SL, X_RightIn,
        Y_LD, count_LD, count_CE, Done, Err}        != out2) wrong = wrong + 1;

        ////////////
        //State 3a//
        ///////////
        rst = 0;
        R_lt_Y = 0;
        Go = 0;
        cnt_out = 0;
        zero = 0;

        clk_pulse;

        if ({muxstart_sel, muxrem_sel, muxquo_sel, 
        R_LD, R_SL, R_SR, X_LD, X_SL, X_RightIn,
        Y_LD, count_LD, count_CE, Done, Err}        != out3a) wrong = wrong + 1;

        ////////////
        //State 4//
        ///////////
        rst = 0;
        R_lt_Y = 0;
        Go = 0;
        cnt_out = 0;
        zero = 0;

        clk_pulse;

        if ({muxstart_sel, muxrem_sel, muxquo_sel, 
        R_LD, R_SL, R_SR, X_LD, X_SL, X_RightIn,
        Y_LD, count_LD, count_CE, Done, Err}        != out4) wrong = wrong + 1;

        ////////////
        //State 3b//
        ///////////
        rst = 0;
        R_lt_Y = 1;
        Go = 0;
        cnt_out = 0;
        zero = 0;

        clk_pulse;

        if ({muxstart_sel, muxrem_sel, muxquo_sel, 
        R_LD, R_SL, R_SR, X_LD, X_SL, X_RightIn,
        Y_LD, count_LD, count_CE, Done, Err}        != out3b) wrong = wrong + 1;

        ////////////
        //State 5//
        ///////////
        rst = 0;
        R_lt_Y = 1;
        Go = 0;
        cnt_out = 0;
        zero = 0;

        clk_pulse;

        if ({muxstart_sel, muxrem_sel, muxquo_sel, 
        R_LD, R_SL, R_SR, X_LD, X_SL, X_RightIn,
        Y_LD, count_LD, count_CE, Done, Err}        != out5) wrong = wrong + 1;

        ////////////
        //State 6//
        ///////////
        rst = 0;
        R_lt_Y = 0;
        Go = 0;
        cnt_out = 1;
        zero = 0;

        clk_pulse;

        if ({muxstart_sel, muxrem_sel, muxquo_sel, 
        R_LD, R_SL, R_SR, X_LD, X_SL, X_RightIn,
        Y_LD, count_LD, count_CE, Done, Err}        != out6) wrong = wrong + 1;

        ////////////
        //State 7//
        ///////////
        rst = 0;
        R_lt_Y = 0;
        Go = 0;
        cnt_out = 1;
        zero = 0;

        clk_pulse;

        if ({muxstart_sel, muxrem_sel, muxquo_sel, 
        R_LD, R_SL, R_SR, X_LD, X_SL, X_RightIn,
        Y_LD, count_LD, count_CE, Done, Err}        != out7) wrong = wrong + 1;

        ////////////
        //State 0//
        ///////////
        rst = 0;
        R_lt_Y = 0;
        Go = 0;
        cnt_out = 0;
        zero = 0;

        clk_pulse;

        if ({muxstart_sel, muxrem_sel, muxquo_sel, 
        R_LD, R_SL, R_SR, X_LD, X_SL, X_RightIn,
        Y_LD, count_LD, count_CE, Done, Err}        != out0) wrong = wrong + 1;

        ////////////
        //State 0//
        ///////////
        rst = 0;
        R_lt_Y = 0;
        Go = 1;
        cnt_out = 0;
        zero = 1;

        clk_pulse;

        if ({muxstart_sel, muxrem_sel, muxquo_sel, 
        R_LD, R_SL, R_SR, X_LD, X_SL, X_RightIn,
        Y_LD, count_LD, count_CE, Done, Err}        != out0) wrong = wrong + 1;

        ////////////
        //State 1//
        ///////////
        rst = 0;
        R_lt_Y = 0;
        Go = 1;
        cnt_out = 0;
        zero = 0;

        clk_pulse;

        if ({muxstart_sel, muxrem_sel, muxquo_sel, 
        R_LD, R_SL, R_SR, X_LD, X_SL, X_RightIn,
        Y_LD, count_LD, count_CE, Done, Err}        != out1) wrong = wrong + 1;
       
        ////////////
        //State 2//
        ///////////
        rst = 0;
        R_lt_Y = 0;
        Go = 0;
        cnt_out = 0;
        zero = 0;

        clk_pulse;

        if ({muxstart_sel, muxrem_sel, muxquo_sel, 
        R_LD, R_SL, R_SR, X_LD, X_SL, X_RightIn,
        Y_LD, count_LD, count_CE, Done, Err}        != out2) wrong = wrong + 1;

        ////////////
        //Reset//
        ///////////
        rst = 1;
        R_lt_Y = 0;
        Go = 0;
        cnt_out = 0;
        zero = 0;

        clk_pulse;

        if ({muxstart_sel, muxrem_sel, muxquo_sel, 
        R_LD, R_SL, R_SR, X_LD, X_SL, X_RightIn,
        Y_LD, count_LD, count_CE, Done, Err}        != out0) wrong = wrong + 1;

        #20
        /////////////////
        //error summary//
        ////////////////
        if (wrong == 0) $display ("Simulation completed. No errs.");
        else            $display ("%d errs in simulation", wrong);


    $stop;
    end

endmodule