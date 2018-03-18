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

    reg [7:0] in;
    reg [7:0] out;

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

        clk = 0;
        rst = 0;
        en = 1;

        for(i_A = 0; i_A < 16; i_A = i_A + 1)
        begin
            A = i_A;
            for(i_B = 0; i_B < 16; i_B = i_B + 1)
            begin
                B = i_B;

                out = in;
                in = A * B;

                #5 clk = 1;
                #5 clk = 0;
                if((P === 8'bx) || (P == out) );
                else 
                begin
                    error = error + 1;
                    $display("error in out. P: %d out: %d", P, out);    
                end
                
                #5 clk = 1;
                #5 clk = 0;
                if(P != in)
                begin
                    error = error + 1;
                    $display("error in IN. P: %d IN: %d", P, in);
                end
            end
        end

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