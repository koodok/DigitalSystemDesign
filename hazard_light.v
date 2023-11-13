module hazard_light(rst,light_out1,light_out2);

input rst;
output reg light_out1,light_out2;

always@(*)
begin
	if(rst)
		begin
		light_out1 <= 0;
		light_out2 <= 0;
		end
	else
		begin
		light_out1 <= 1;
		light_out2 <= 1;
		end
end

endmodule