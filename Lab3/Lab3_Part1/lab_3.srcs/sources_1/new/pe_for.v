module FOR_ENC8_3 (input [7:0] A, output reg [2:0] Y, output reg Valid);

integer N;
always @ (A)
begin
	
	Valid = 0;
	Y = 3'bX;
	for (N = 0; N < 8; N = N + 1)
	begin
		if (A[N])
			begin
				Valid = 1;
				Y = N;
			end
	end 
end
endmodule