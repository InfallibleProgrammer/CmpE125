`timescale 1ns / 1ps

module FSM(
    input        Go,
    input  [1:0] Op,
    input        clk,
    output [1:0] s1,
    output [1:0] wa,
    output       we,
    output [1:0] raa,
    output       rea,
    output [1:0] rab,
    output       reb,
    output [1:0] c,
    output       s2,
    output [3:0] CS,
    output       Done
    );

    reg [3:0] next_state;

    //sequential logic
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
        endcase
        
    //output logic
    always @ (CS)
    begin
        case (CS)
            0 : begin
                    s1 =   2'b01;
                    wa =   2'b00;
                    we =   0;
                    raa =  2'b00;
                    rea =  0;
                    rab =  2'b00;
                    reb =  0;
                    c =    2'b00;
                    s2 =   0;
                    Done = 0;
                end
            1 : begin
                    s1 =   2'b11;
                    wa =   2'b01;
                    we =   1;
                    raa =  2'b00;
                    rea =  0;
                    rab =  2'b00;
                    reb =  0;
                    c =    2'b00;
                    s2 =   0;
                    Done = 0;
                end
            2 : begin
                    s1 =   2'b10;
                    wa =   2'b10;
                    we =   1;
                    raa =  2'b00;
                    rea =  0;
                    rab =  2'b00;
                    reb =  0;
                    c =    2'b00;
                    s2 =   0;
                    Done = 0;
                end
            3 : begin
                    case (Op) 
                    3:  begin     
                            s1 =   2'b00;
                            wa =   2'b11;
                            we =   1;
                            raa =  2'b01;
                            rea =  1;
                            rab =  2'b10;
                            reb =  1;
                            c =    2'b00;
                            s2 =   0;
                            Done = 0;
                        end
                    2:  begin
                            s1 =   2'b00;
                            wa =   2'b11;
                            we =   1;
                            raa =  2'b01;
                            rea =  1;
                            rab =  2'b10;
                            reb =  1;
                            c =    2'b01;
                            s2 =   0;
                            Done = 0;
                        end
                    1 : begin
                            s1 =   2'b00;
                            wa =   2'b11;
                            we =   1;
                            raa =  2'b01;
                            rea =  1;
                            rab =  2'b10;
                            reb =  1;
                            c =    2'b10;
                            s2 =   0;
                            Done = 0;
                        end
                    
                    0 : begin
                            s1 =   2'b00;
                            wa =   2'b11;
                            we =   1;
                            raa =  2'b01;
                            rea =  1;
                            rab =  2'b10;
                            reb =  1;
                            c =    2'b11;
                            s2 =   0;
                            Done = 0;
                        end
                    endcase
                end
            4 : begin
                    s1 =   2'b01;
                    wa =   2'b00;
                    we =   0;
                    raa =  2'b11;
                    rea =  1;
                    rab =  2'b11;
                    reb =  1;
                    c =    2'b10;
                    s2 =   1;
                    Done = 1;
                end
        endcase
    end

endmodule
