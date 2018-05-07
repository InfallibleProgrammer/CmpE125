`timescale 1ns / 1ps

module CU(
    input            Go,
    input            clk,
    input            rst,
    input            R_lt_Y,
    input            cnt_out,
    input            DBZ,
    output reg       muxstart_sel,
    output reg       muxrem_sel,
    output reg       muxquo_sel,
    output reg       R_LD,
    output reg       R_SL,
    output reg       R_SR,
    output reg       X_LD,
    output reg       X_SL,
    output reg       X_RightIn,
    output reg       Y_LD,
    output reg       count_LD,
    output reg       count_CE,
    output reg       Done,
    output reg       Err,
    output reg [2:0] CS
    );

	parameter   out0 	= 14'b000_00_000_000_0_00,
            	out1 	= 14'b000_11_001_010_1_00,
            	out2 	= 14'b000_00_010_100_0_00,
            	out3a   = 14'b100_10_001_000_0_00,
            	out3b   = 14'b000_10_000_000_0_00,
            	out4 	= 14'b000_00_010_101_0_00,
            	out5 	= 14'b000_00_010_100_0_00,
            	out6 	= 14'b000_00_100_000_0_00,
            	out7a   = 14'b011_00_000_000_0_10,
            	out7b   = 14'b000_00_000_000_0_11;


    reg [2:0] next_state;
    reg [13:0] out_sig;

    //state regsiter
    always @ (posedge clk, posedge rst)
    begin
        if (rst) CS <= 0;
        else CS <= next_state;
    end

    //output control
    always @ (out_sig)
    begin
        {muxstart_sel, muxrem_sel, muxquo_sel,
        count_CE, count_LD, R_SR, R_SL, R_LD, X_SL,
        X_LD, X_RightIn, Y_LD, Done, Err} = out_sig;
    end

    //state transtions
    always @ (CS, Go, DBZ)
    begin
        case (CS)
            0:  begin
                    if (Go) next_state = 1;
                    else    next_state = 0;
                end
            1: next_state = 2;
            2:  begin
                    if (DBZ) next_state = 7;
                    else     next_state = 3;
                end
            3:  begin
                    if (R_lt_Y) next_state = 5;
                    else        next_state = 4;
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

    //output logic
    always @ (CS)
    begin
        case (CS)
            0: out_sig = out0;
            1: out_sig = out1;
            2: out_sig = out2;
            3:  begin
                    if (R_lt_Y) out_sig = out3b;
                    else        out_sig = out3a;
                end
            4: out_sig = out4;
            5: out_sig = out5;
            6: out_sig = out6;
            7:  begin
                    if (DBZ) out_sig = out7b;
                    else     out_sig = out7a;
                end
        endcase
    end

endmodule
