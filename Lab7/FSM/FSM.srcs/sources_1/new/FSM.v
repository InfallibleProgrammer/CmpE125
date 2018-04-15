`timescale 1ns / 1ps

module FSM(
    input            Go,
    input      [1:0] Op,
    input            clk,
    output reg [1:0] s1,
    output reg [1:0] wa,
    output reg       we,
    output reg [1:0] raa,
    output reg       rea,
    output reg [1:0] rab,
    output reg       reb,
    output reg [1:0] c,
    output reg       s2,
    output reg [3:0] CS,
    output reg       Done
    );

    parameter out0   = 15'b_01_00_0_00_0_00_0_00_0_0,  
              out1   = 15'b_11_01_1_00_0_00_0_00_0_0,
              out2   = 15'b_10_10_1_00_0_00_0_00_0_0,
              out3_3 = 15'b_00_11_1_01_1_10_1_00_0_0, //3
              out3_2 = 15'b_00_11_1_01_1_10_1_01_0_0, //2
              out3_1 = 15'b_00_11_1_01_1_10_1_10_0_0, //1
              out3_0 = 15'b_00_11_1_01_1_10_1_11_0_0, //0
              out4   = 15'b_01_00_0_11_1_11_1_10_1_1;

    reg [3:0]  next_state;
    reg [14:0] out_sig;

    always @ (posedge clk)
    begin
        CS = next_state;    
    end
    
    //state transitions
    always @ (CS, Go)
    begin
      case (CS)
        0: begin
            if (Go) next_state = 1;
            else    next_state = 0; 
           end
        1: next_state = 2;
        2: next_state = 3;
        3: next_state = 4;
        4: next_state = 0; 
        default: next_state = 0;
        endcase
    end

    always @ (out_sig)
    begin
        {s1,wa,we,raa,rea,rab,reb,c,s2,Done} = out_sig;
    end
        
    //output logic
    always @ (CS)
    begin
        case (CS)
            0: out_sig = out0;
            1: out_sig = out1;
            2: out_sig = out2;
            3: begin
                    case (Op) 
                    3: out_sig = out3_3;
                    2: out_sig = out3_2;
                    1: out_sig = out3_1;
                    0: out_sig = out3_0;
                    endcase
                end
            4: out_sig = out4;
        endcase
    end

endmodule
