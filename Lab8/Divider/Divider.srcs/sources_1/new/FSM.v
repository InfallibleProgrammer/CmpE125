`timescale 1ns / 1ps

module FSM(
    input  Go,
    input  clk,
    input  rst,
    input  R_lt_Y,
    input  cnt_out,
    input  zero,
    output muxstart_sel,
    output muxrem_sel,
    output muxquo_sel,
    output R_LD,
    output R_SL,
    output R_SR,
    output X_LD,
    output X_SL,
    output X_RightIn,
    output Y_LD,
    output count_LD,
    output count_CE,
    output Done,
    output Err,
    );

    parameter error = 14'b_0_0_0_0_0_0_0_0_0_0_0_0_0_1,
              out0  = 14'b_0_0_0_0_0_0_0_0_0_0_0_0_0_0,
              out1  = 14'b_1_0_0_1_0_0_1_0_0_1_1_0_0_0,
              out2  = 14'b_0_0_0_0_1_0_0_1_0_0_0_0_0_0,
              out3a = 14'b_1_0_0_1_0_0_0_0_0_0_0_1_0_0,
              out3b = 14'b_0_0_0_0_0_0_0_0_0_0_0_1_0_0,
              out4  = 14'b_0_0_0_0_1_0_0_1_1_0_1_0_0_0,
              out5  = 14'b_0_0_0_0_1_0_0_1_0_0_1_0_0_0,
              out6  = 14'b_0_0_0_0_0_1_0_0_0_0_0_0_0_0,
              out7  = 14'b_0_1_1_0_0_0_0_0_0_0_0_0_1_0;

    reg [2:0] current_state;
    reg [2:0] next_state;
    reg [13:0] out_sig;

    //state regsiter
    always @ (posedge clk)
    begin
        current_state = next_state;
    end

    //state transtions
    always @ (current_state, Go, posedge rst)
    begin
        if (rst) next_state = 0;
        else
        begin
            case (current_state)
                0:  begin
                        if (zero) next_state = 0;
                        else
                        begin
                            if (Go) next_state = 1;
                            else    next_state = 0;
                        end
                    end
                1: next_state = 2;
                2: next_state = 3;
                3:  begin
                        if (R_lt_Y) next_state = 4;
                        else        next_state = 5;
                    end
                4:  begin
                        if (cnt_out) next_state = 6;
                        else         next_state = 3;
                    end
                5:  begin
                        if (cnt_out) next_state = 6;
                        else         next_state = 3;
                    end
                6: next_state = 7;
                7: next_state = 0;
                default: next_state = 0;
            endcase
        end
    end

    //output control
    always @ (out_sig)
    begin
        {muxstart_sel, muxrem_sel, muxquo_sel,
        R_LD, R_SL, R_SR, X_LD, X_SL, X_RightIn,
        Y_LD, count_LD, count_CE, Done, Err} = out_sig
    end

    //output logic
    always @ (current_state)
    begin
        case (current_state)
            0:  begin
                    if (zero) out_sig = err;
                    else      out_sig = out0;
                end
            1: out_sig = out1;
            2: out_sig = out2;
            3:  begin
                    if (R_lt_Y) out_sig = out3a;
                    else        out_sig = out3b;
                end
            4: out_sig = out4;
            5: out_sig = out5;
            6: out_sig = out6;
            7: out_sig = out7;
        endcase
    end

endmodule
