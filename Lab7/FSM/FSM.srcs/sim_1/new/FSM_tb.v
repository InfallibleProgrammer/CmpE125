`timescale 1ns / 1ps

module FSM_tb();

  reg Go;
  reg [1:0] Op;
  reg clk;
  wire [1:0] s1;
  wire [1:0] wa;
  wire we;
  wire [1:0] raa;
  wire rea;
  wire [1:0] rab;
  wire reb;
  wire [1:0] c;
  wire s2;
  wire [3:0] CS;
  wire Done;
  

  FSM DUT (
  .Go   (Go),
  .Op   (Op),
  .clk  (clk),
  .s1   (s1),
  .wa   (wa),
  .we   (we),
  .raa  (raa),
  .rea  (rea),
  .rab  (rab),
  .reb  (reb),
  .c    (c),
  .s2   (s2),
  .CS   (CS),
  .Done (Done)
  );

  parameter out0   = 15'b_01_00_0_00_0_00_0_00_0_0,  
            out1   = 15'b_11_01_1_00_0_00_0_00_0_0,
            out2   = 15'b_10_10_1_00_0_00_0_00_0_0,
            out3_3 = 15'b_00_11_1_01_1_10_1_00_0_0, //3
            out3_2 = 15'b_00_11_1_01_1_10_1_01_0_0, //2
            out3_1 = 15'b_00_11_1_01_1_10_1_10_0_0, //1
            out3_0 = 15'b_00_11_1_01_1_10_1_11_0_0, //0
            out4   = 15'b_01_00_0_11_1_11_1_10_1_1;

  task clk_pulse;
    begin
    #5 clk = 1;
    #5 clk = 0;
    end
  endtask
  
  integer error;
  integer i_Op;


  initial begin
    error = 0;

    for (i_Op = 0; i_Op < 4; i_Op = i_Op + 1)
    begin
        Op = i_Op;
        
        Go = 0;
        clk_pulse;
        //state 0
        if ({s1,wa,we,raa,rea,rab,reb,c,s2,Done} != out0) error = error + 1;
        clk_pulse;

        Go = 1;

        //state 1
        clk_pulse;
        if ({s1,wa,we,raa,rea,rab,reb,c,s2,Done} != out1) error = error + 1;

        //state 2
        clk_pulse;
        if ({s1,wa,we,raa,rea,rab,reb,c,s2,Done} != out2) error = error + 1;

        //state 3 where Op is used
        clk_pulse;
        case (i_Op)
        3: if ({s1,wa,we,raa,rea,rab,reb,c,s2,Done} != out3_3) error = error + 1;
        2: if ({s1,wa,we,raa,rea,rab,reb,c,s2,Done} != out3_2) error = error + 1;
        1: if ({s1,wa,we,raa,rea,rab,reb,c,s2,Done} != out3_1) error = error + 1;
        0: if ({s1,wa,we,raa,rea,rab,reb,c,s2,Done} != out3_0) error = error + 1;
        endcase
        
        //state 4
        clk_pulse;
        if ({s1,wa,we,raa,rea,rab,reb,c,s2,Done} != out4) begin error = error + 1; $display("Here");end

        //transition back to state 0
        clk_pulse;
        
    end

    if (error == 0) $display("Simulation completed. No errors.");
    else $display("Errors in simulation: %d", error);
    $stop;
  end
endmodule

