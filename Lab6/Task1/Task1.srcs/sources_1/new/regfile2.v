`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module regfile2 (
	input			clk, we1, we2,
	input 	[31:0]	wd1,
	input	[31:0]	wd2,
	input	[4:0]	ra1,
	input	[4:0]	ra2,
	input	[4:0]	wa1,
	input	[4:0]	wa2,
	output	[31:0]	rd2,
	output	[31:0]	rd1
	);
	reg [31:0] RF [31:0];
	

	always@(posedge clk)
	begin
		if(we1) RF[wa1] <= wd1;
		else    RF[wa1] <= RF[wa1];
		if(we2) RF[wa2] <= wd2;
		else    RF[wa2] <= RF[wa2];
	end
	assign rd1 = (ra1 !=0) ? RF[ra1]:0;
	assign rd2 = (ra2 !=0) ? RF[ra2]:0;

endmodule