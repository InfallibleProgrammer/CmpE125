`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/19/2018 02:47:10 PM
// Design Name: 
// Module Name: shifter_rotater
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


module shifter_rotator(input [2:0] ctrl, input [3:0] A, output reg[3:0] B);

always@(A)
begin

   //shift
   if ((ctrl[2] == 0) || (ctrl == 4))
   begin
       if (ctrl == 1)
       begin
           B[0] = A[1];
           B[1] = A[2];
           B[2] = A[3];
           B[3] = 0;
       end
       else if (ctrl == 2)
       begin
           B[0] = A[2];
           B[1] = A[3];
           B[2] = 0;
           B[3] = 0;    
       end
       else if (ctrl == 3)
       begin
           B = 0;
           B[0] = A[3];
       end
       
       else if (ctrl == 4)
       begin
           B = 0;
       end

   end
   
   //rotate
   else
   begin
       if (ctrl == 5)
       begin    
           B[0] = A[1];
           B[1] = A[2];
           B[2] = A[3];
           B[3] = A[0];
       end
       else if (ctrl == 6)
       begin
           B[0] = A[2];
           B[1] = A[3];
           B[2] = A[0];
           B[3] = A[1];
       end
       else if (ctrl == 7)
       begin
           B[0] = A[3];
           B[1] = A[0];
           B[2] = A[1];
           B[3] = A[2];
       end
   end

end

endmodule