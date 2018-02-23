`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2018 01:31:17 PM
// Design Name: 
// Module Name: tb_encoder
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


module tb_encoder();
  reg [7:0] a1;
  reg [7:0] a2;
  reg [7:0] a3;
  integer M;
  wire [2:0] out1;
  wire [2:0] out2;
  wire [2:0] out3;
  wire valid1;
  wire valid2;
  wire valid3;
  IF_ENC8_3 DUT1(a1, out1, valid1);
  FOR_ENC8_3 DUT2(a2,out2, valid2);
  CASEZ_ENC8_3 DUT3(a3,out3, valid3);

  initial begin
    for(M=0; M <256; M = M +1)
    begin
      #5
      a1 = M;
      a2 = M;
      a3 = M;
      if(valid1 != 1)
      begin 
        $display("IF Encoder: Simulation does not work. Invalid input/output");
      end
      else
      if(valid1 == 1)
      begin 
        $display("IF Encoder: Simulation worked");
      end
      if(valid2 != 1)
      begin 
        $display("FOR Encoder: Simulation does not work. Invalid input/output");
      end
      else
      if(valid2 == 1)
      begin 
        $display("FOR Encoder: Simulation worked");
      end
      if(valid3 != 1)
      begin 
        $display("CASEZ Encoder: Simulation does not work. Invalid input/output");
      end
      else
      if(valid3 == 1)
      begin 
        $display("CASEZ Encoder: Simulation worked");
      end
    end 
  end
endmodule
