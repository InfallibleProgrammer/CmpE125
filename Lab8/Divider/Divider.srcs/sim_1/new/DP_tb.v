`timescale 1ns / 1ps

module DP_tb();

    reg  [3:0] X;
    reg  [3:0] Y;
    reg  [2:0] n;
    reg        clk;
    reg        rst;
    reg        muxstart_sel;
    reg        muxrem_sel;
    reg        muxquo_sel;
    reg        R_LD;
    reg        R_SL;
    reg        R_SR;
    reg        X_LD;
    reg        X_SL;
    reg        X_RightIn;
    reg        Y_LD;
    reg        count_LD;
    reg        count_CE;
    wire       zero;
    wire [3:0] R;
    wire [3:0] Q;
    wire       R_lt_Y;
    wire cnt_out;

    task clk_pulse;
    begin
        #1 clk = 1;
        #1 clk = 0;
    end
    endtask


    DP DUT(
        .X            (X),
        .Y            (Y),
        .n            (n),
        .clk          (clk),
        .rst          (rst),
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
        .zero         (zero),
        .R            (R),
        .Q            (Q),
        .R_lt_Y       (R_lt_Y),
        .cnt_out      (cnt_out)
    );

    initial begin

        rst = 0;

        ///////////////////
        //check 0s of mux//
        ///////////////////

        muxquo_sel = 0;
        muxrem_sel = 0;
        #10 //R and Q should be 0

        muxstart_sel = 0;
        R_LD = 1;
        clk_pulse;
        muxrem_sel = 1;
        #10 //R should be 0

        ////////////////////////
        //check X path through//
        ////////////////////////

        X = 1;
        X_LD = 1;
        clk_pulse;
        muxquo_sel = 1;
        #10 //R should be 1

        //////////////////////////////////
        //shift X left with both 0 and 1//
        //////////////////////////////////
        X_LD = 0;
        X_SL = 1;
        X_RightIn = 0;
        clk_pulse;
        muxquo_sel = 1;
        #10 //R should be 2

        X_LD = 0;
        X_SL = 1;
        X_RightIn = 1;
        clk_pulse;
        muxquo_sel = 1;
        #10 //R should be 5

        //////////////////////////////////////////
        //load R with data shift right then left//
        //////////////////////////////////////////

        R_LD = 1;
        muxstart_sel = 0;
        clk_pulse;
        muxrem_sel = 1;
        #10 //R should be 0

        X_SL = 0;
        X_RightIn = 0;
        X_LD = 1;
        X = 8; //X[3] = 1
        clk_pulse;
        R_LD = 0;
        R_SL = 1;
        clk_pulse;
        muxrem_sel = 1;
        #10 //R should be 1

        R_SL = 0;
        R_SR = 1;
        R_LD = 0;
        clk_pulse;
        muxrem_sel = 1;
        #10 //R should be 0 because shifted 1 back out

        //////////////
        //check comp//
        //////////////
        muxstart_sel = 0;
        R_LD = 1;
        Y = 5;
        Y_LD = 1;
        clk_pulse;
        #10 //R_lt_Y should be 1

        muxstart_sel = 0;
        R_LD = 1;
        Y = 0;
        Y_LD = 1;
        clk_pulse;
        #10 //R_lt_Y should be 0

        /////////////
        //check sub//
        /////////////
        X = 8;
        X_LD = 1;
        clk_pulse;

        R_LD = 0;
        R_SL = 1;
        R_SR = 0;
        clk_pulse; //R_out = 1
        clk_pulse; //R_out = 3
        clk_pulse; //R_out = 7
        R_SL = 0;
        Y_LD = 1;
        Y = 4;
        clk_pulse;
        #10 //sub = 3
        muxstart_sel = 1;
        R_LD = 1;
        clk_pulse;
        R_LD = 0;
        muxrem_sel = 1;
        #10 //R = 3

        //////////////
        //ud_counter//
        //////////////
        count_CE = 1;
        count_LD = 1;
        n = 7;
        clk_pulse; //cnt_out = 1;

        //count down to 0
        count_LD = 0;
        count_CE = 1;
        clk_pulse;
        clk_pulse;
        clk_pulse;
        clk_pulse;
        clk_pulse;
        clk_pulse;
        clk_pulse;
        //cnt_out should be 1

        $stop;
    end

endmodule
