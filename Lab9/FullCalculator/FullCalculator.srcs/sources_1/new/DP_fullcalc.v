`timescale 1ns / 1ps

module DP_fullcalc(
    input [3:0] Xa,
    input [3:0] Ya,
    input [2:0] Op_F,
    input En_F,
    input En_X,
    input En_Y,
    input Go_Calc,
    input Op_Calc,
    input Go_DIV,
    input Sel_H,
    input Sel_L,
    input Sel_squared,
    input En_Out_H,
    input En_Out_L,
    output [3:0] Out_Ha,
    output [3:0] Out_La,
    output [2:0] Out_F,
    output Done_Calc,
    output Done_DIV,
    output Div_Err
    );
    
    shift_register F (
        .D       (),
        .LeftIn  (1'b0),
        .RightIn (1'b0),
        .LD      (),
        .SL      (0),
        .SR      (0),
        .RST     (),
        .CLK     (),
        .Q       (),
        .DBZ     ()
    );
    shift_register X (
        .D       (),
        .LeftIn  (1'b0),
        .RightIn (1'b0),
        .LD      (),
        .SL      (0),
        .SR      (0),
        .RST     (),
        .CLK     (),
        .Q       (),
        .DBZ     ()
    );
    shift_register Y (
        .D       (),
        .LeftIn  (1'b0),
        .RightIn (1'b0),
        .LD      (),
        .SL      (0),
        .SR      (0),
        .RST     (),
        .CLK     (),
        .Q       (),
        .DBZ     ()
    );
    
    mux2 squared (
        .d1  (),
        .d2  (),
        .sel (),
        .y   ()
    );
    
    FSM_DP small_calc (
        .Go   (),
        .Op   (),
        .In1  (),
        .In2  (),
        .clk  (),
        .CS   (),
        .Done (),
        .Out  ()
    );
    
    parallel_multiplier_top mult (
        .inA (),
        .inB (),
        .clk (),
        .rst (),
        .en  (),
        .P   ()
    );
    
    divider div (
        .Go        (),
        .rst       (),
        .clk       (),
        .Dividend  (),
        .Divisor   (),
        .Done      (),
        .Err       (),
        .Quotient  (),
        .Remainder (),
        .CS        ()
    );
    
    mux2 MUX_H (
        .d1  (),
        .d2  (),
        .sel (),
        .y   ()
    );
    mux2 MUX_L (
        .d1  (),
        .d2  (),
        .sel (),
        .y   ()
    );
    
    shift_register Out_H (
        .D       (),
        .LeftIn  (1'b0),
        .RightIn (1'b0),
        .LD      (),
        .SL      (0),
        .SR      (0),
        .RST     (),
        .CLK     (),
        .Q       (),
        .DBZ     ()
    );
    shift_register Out_L (
        .D       (),
        .LeftIn  (1'b0),
        .RightIn (1'b0),
        .LD      (),
        .SL      (0),
        .SR      (0),
        .RST     (),
        .CLK     (),
        .Q       (),
        .DBZ     ()
    );
endmodule
