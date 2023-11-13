module driving_time ( ab_out,cg_out, start);

input [7:0] ab_out,cg_out;

output reg [8:0] start;

always@(cg_out)
begin
	if(ab_out)
		begin
		start <= cg_out;
		end
	else
		begin
		start <= ab_out;
		end
end

endmodule