module mode_counter(Key, MODE);

input Key;
output reg [1:0] MODE;

always @ (posedge Key)
   begin
		begin
			if (MODE < 1)
				begin
					MODE <= MODE + 1;
				end
			else
				begin
					MODE <= 0;
				end
		end
   end
endmodule