`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2018 02:45:34 PM
// Design Name: 
// Module Name: task1_tb
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


module task1_tb();
	reg clk, we1, we2;
	reg [31:0]  wd1;
	reg	[31:0]	wd2;
	reg	[4:0]	ra1;
	reg	[4:0]	ra2;
	reg	[4:0]	wa1;
	reg	[4:0]	wa2;
	wire [31:0] rd2;
	wire [31:0] rd1;
	integer error;
	regfile2 DUT (
		.clk	(clk),
		.we1	(we1),
		.we2	(we2),
		.wd1    (wd1),
		.wd2    (wd2),
		.ra1	(ra1),
		.ra2	(ra2),
		.wa1	(wa1),
		.wa2	(wa2),
		.rd2	(rd2),
		.rd1	(rd1)
		);
	integer iwa1;
	integer iwa2;
	integer ira1;
	integer ira2;
    initial begin
	error = 0;
	clk = 0;
    
	for(iwa1 = 0; iwa1 < 32; iwa1 = iwa1 + 1)
	begin
		wa1 = iwa1;
		wd1 = 2 + wa1;
		we1 = 1;
		we2 = 0;
		#1
		clk = ~clk;
		#1
		clk = ~clk;
	end

	for(ira1 = 0; ira1 < 32; ira1 = ira1 + 1)
	begin
		ra1 = ira1; 
		we1 = 0;
		we2 = 0;
		#1
		if(rd1 != (2+ra1))
		begin
            if(ra1 == 0)
            begin
            end
            else
            begin
            error = error + 1;
            end
        end
	end

	for(iwa2 = 0; iwa2 < 32; iwa2 = iwa2 + 1)
	begin
		wa2 = iwa2;
		wd2 = 2 + wa2;
		we2 = 1;
		we1 = 0;
		#1
		clk = ~clk;
		#1
		clk = ~clk;
	end

	for(ira2 = 0; ira2 < 32; ira2 = ira2 + 1)
	begin 
		ra2 = ira2;
		we2 = 0;
		we1 = 0;
		#1
		if(rd2 != (2+ra2))
		begin
		    if(ra2 == 0)
		    begin
		    end
		    else
		    begin
			error = error + 1;
			end
		end
	end
	wd1 = 10;
	ra1 = 3;
	ra2 = 3;
	wa1 = 3;
	we1 = 1; 
	#10
    clk = ~clk;
    #10
    clk = ~clk;
	$display("This is the error count:%d", error);
	$finish;
	end
endmodule
