module winker(RST, gen, count, in, out);

input RST, gen, in, count;
output reg out;

always@(*)
begin 
	if(RST)
		begin 
			if(gen)
				begin 
					if(in)
						begin
							out = count;
						end 
						else
						begin 
							out =0;
						end 
				end 
				else
				begin
					out = 0;
				end
		end 
		else
		begin
			out = 0;
		end
	end
		
endmodule
