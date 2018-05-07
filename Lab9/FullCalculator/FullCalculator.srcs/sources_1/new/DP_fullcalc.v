`timescale 1ns / 1ps

module DP_fullcalc(

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
