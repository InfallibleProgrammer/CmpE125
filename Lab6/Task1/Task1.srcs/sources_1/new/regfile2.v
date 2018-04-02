`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module regfile2  #(parameter word_width = 32, parameter rf_size = 32, parameter addr_size = 4)(
	input						clk, we1, we2,
	input 	[word_width-1:0]	wd1,
	input	[word_width-1:0]	wd2,
	input	[addr_size -1:0]	ra1,
	input	[addr_size-1:0]		ra2,
	input	[addr_size-1:0]		wa1,
	input	[addr_size-1:0]		wa2,
	output	[word_width-1:0]	rd2,
	output	[word_width-1:0]	rd1
	);
	reg [word_width-1:0] RF [rf_size-1:0];
	

	always@(posedge clk)
	begin
		if(we1) RF[wa1] <= wd1;
		if(we2) RF[wa2] <= wd2;
	end
	assign rd1 = (ra1 !=0) ? RF[ra1]:0;
	assign rd2 = (ra2 !=0) ? RF[ra2]:0;

endmodule