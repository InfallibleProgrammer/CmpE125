`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/20/2018 05:23:50 PM
// Design Name: 
// Module Name: tb_shifter_rotator
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


module tb_shifter_rotator();

	reg  [2:0] ctrl_in;
	reg  [3:0] data_in;
	wire [3:0] data_out;
	
	reg  [3:0] tb_data_out;
	integer    i_ctrl_in;
	integer    i_data_in;
	integer    error = 0;

	shifter_rotator DUT(
		.ctrl_in  (ctrl_in), 
		.data_in  (data_in), 
		.data_out (data_out)
		);

	initial begin
		for (i_ctrl_in = 0; i_ctrl_in < 8; i_ctrl_in = i_ctrl_in + 1)
			begin
			ctrl_in = i_ctrl_in;
			#5
				for (i_data_in = 0; i_data_in < 16; i_data_in = i_data_in + 1)
					begin
						data_in = i_data_in;
						case(ctrl_in)
							0: tb_data_out = data_in;
							1: tb_data_out = {1'b0, data_in[3:1]};
							2: tb_data_out = {2'b00, data_in[3:2]};
							3: tb_data_out = {3'b000, data_in[3]};
							4: tb_data_out = {4'b0000};
							5: tb_data_out = {data_in[0], data_in[3:1]};
							6: tb_data_out = {data_in[1:0], data_in[3:2]};
							7: tb_data_out = {data_in[2:0], data_in[3]};
						endcase // i_ctrl_in
						#5
						if (tb_data_out != data_out)
						begin
							error = error + 1;
							$display("Error: with input %d on control %d", data_in, ctrl_in);
							$display("tb_data_out: %d ______ data_out: %d", tb_data_out, data_out);
						end
					end
			end
	$finish;
	end

endmodule
