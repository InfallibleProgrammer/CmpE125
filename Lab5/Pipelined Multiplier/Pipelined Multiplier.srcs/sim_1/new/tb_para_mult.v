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


module tb_para_mult();

    

	reg  [3:0] A;
	reg  [3:0] B;
	reg        clk;
	reg        rst;
	reg        en;
	wire [7:0] P;

    reg [7:0] stage1;
    reg [7:0] stage2;
    reg [7:0] stage3;

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

	integer error = 0;


	initial begin

        clk = 1;
        rst = 0;
        en = 1;

        for(i_A = 0; i_A < 16; i_A = i_A + 1)
        begin
            A = i_A;
            for(i_B = 0; i_B < 16; i_B = i_B + 1)
            begin
                B = i_B;

                stage3 = stage2;
                stage2 = stage1;
                stage1 = A * B;

                #1 clk = ~clk;
                #1 clk = ~clk;


                //try not ===
                if ((P == stage3) || (stage3 === 8'bx));
                else
                begin
                    error = error + 1;
                    $display("Error in stage 3. P: %d stage3: %d", P, stage3);
                end
            end
        end

        #1 clk = ~clk;
        #1 clk = ~clk;

        if (P != stage2) error = error + 1;

        #1 clk = ~clk;
        #1 clk = ~clk;

        if (P != stage1) error = error + 1;

        if (error == 0)
        begin
          $display("No errors!");
        end

        if (error != 0)
        begin
            $display("Errors found! Number of Errors %d", error);
        end

    end
endmodule