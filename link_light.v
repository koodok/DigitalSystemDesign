module link_light(clk, in, out);

input clk, in;
output reg out;

always@(*)
begin
	if(in)
		begin
			out = 1;
		end
		else
		begin
			out = 0;
		end
end

endmodule 