`timescale 1ns / 1ps

module CU_fullcalc(
    input            Go,
    input      [2:0] F,
    input            clk,
    input            rst,
    input            Done_Calc,
    input            Done_DIV,
    input            Div_Err,
    output reg       Done,
    output reg       Err,
    output reg       En_F,
    output reg       En_X,
    output reg       En_Y,
    output reg       Go_Calc,
    output reg       Op_Calc,
    output reg       Go_DIV,
    output reg       Sel_H,
    output reg       Sel_L,
    output reg       En_Out_H,
    output reg       En_Out_L,
    output reg [3:0] CS 
    );
    
    reg [3:0] NS;
    reg [13:0] out_sig;
    
    //state register
    always @ (posedge clk, posedge rst)
    begin
        if (rst) CS <= 0;
        else CS <= NS;
    end
    
    //output control
    always @ (out_sig)
    begin
    end

    //state transtions
    always @ (CS, Go)
    begin
        case (CS)
        endcase
    end

    //output logic
    always @ (CS)
    begin
        case (CS)
        endcase
    end
    
endmodule
