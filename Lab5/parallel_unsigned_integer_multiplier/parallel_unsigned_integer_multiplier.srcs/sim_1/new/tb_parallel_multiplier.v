`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/08/2018 10:53:42 PM
// Design Name: 
// Module Name: tb_parallel_multiplier
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_parallel_multiplier();

	reg  [3:0] A;
	reg  [3:0] B;
	reg        clk;
	reg        rst;
	reg        en;
	wire [7:0] P;

	parallel_multiplier_top DUT(
		.inA  (A),
		.inB  (B),
		.P    (P),
		.clk (clk),
		.rst (rst),
		.en  (en)
		);

	integer i_A;
	integer i_B;
	integer clock;
	integer reset;
	integer enable;

	integer tb_P;
	integer error = 0;

	initial begin
	    for(clock = 0; clock < 2; clock = clock + 1)
	       begin
	           clk = clock;
	           #5
	       for(reset = 0; reset < 2; reset = reset + 1)
	           begin
	           rst = reset;
	           #5
	           for(enable = 0; enable < 2; enable = enable + 1)
	           begin
	               en = enable;
	               #5
                    for(i_A = 0; i_A < 16; i_A = i_A + 1)
                        begin
                            A = i_A;
                            for(i_B = 0; i_B < 16; i_B = i_B + 1)
                            begin
                                B = i_B;
                                tb_P = A * B;
                                #5
                                if (tb_P != P)
                                begin
                                    error = error + 1;
                                    $display("tb_P = %d AND P = %d", tb_P, P);
                                    $display("Error count: %d", error);
                                end
                            end
                        end
            
                    if(error == 0)
                    begin
                        $display("Simulation completed. No errors!");
                    end
                    if(error != 0)
                    begin
                        $display("There were %d errors", error);
                    end
                end
             end
        end
    end
endmodule
