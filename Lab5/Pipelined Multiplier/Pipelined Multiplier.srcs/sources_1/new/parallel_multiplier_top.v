`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/08/2018 10:21:53 PM
// Design Name: 
// Module Name: parallel_multiplier_top
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


module parallel_multiplier_top(
	input  [3:0] inA,
	input  [3:0] inB,
    input	   clk,
	input	   rst,
	input	   en,
	output [7:0] P
    );
	
	wire [3:0] A;
	wire [3:0] B;
	wire [3:0] PP3;
	wire [3:0] PP1;
	wire [3:0] PP2;
	wire [3:0] PP0;

	wire [7:0] PP0_PP1_in;
	wire [7:0]  PP0_PP1;
	wire [7:0] PP2_PP3_in;
	wire [7:0] PP2_PP3;

	wire temp;

	wire [7:0] prod;

	pip_reg #(4) pipA(
		.d(inA),
		.clk(clk),
		.rst(rst),
		.en(en),
		.q(A)
	);
	pip_reg #(4) pipB(
		.d(inB),
		.clk(clk),
		.rst(rst),
		.en(en),
		.q(B)
	);	
	and_mod AND_MOD3(
		.A (A),
		.B (B[3]),
		.Y (PP3)
		);

	and_mod AND_MOD2(
		.A (A),
		.B (B[2]),
		.Y (PP2)
		);

	and_mod AND_MOD1(
		.A (A),
		.B (B[1]),
		.Y (PP1)
		);
	
	and_mod AND_MOD0(
		.A (A),
		.B (B[0]),
		.Y (PP0)
		);

	adder_8bit PP0_1(
		.A ({4'b0000, PP0}),
		.B ({3'b000, PP1, 1'b0}),
		.Cin (0),
		.sum (PP0_PP1),
		.Cout (temp)
		);

	adder_8bit PP2_3(
		.A ({2'b00, PP2, 2'b00}),
		.B ({1'b0, PP3, 3'b000}),
		.Cin (0),
		.sum (PP2_PP3),
		.Cout (temp)
		);

	adder_8bit PP_FINAL(
		.A (PP0_PP1),
		.B (PP2_PP3),
		.Cin (0),
		.sum (prod),
		.Cout (temp)
		);

	pip_reg #(8) PP2_PP3reg(
		.d(prod),
		.clk(clk),
		.rst(rst),
		.en(en),
		.q(P)
	);

endmodule
