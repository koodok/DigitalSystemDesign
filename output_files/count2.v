module counter2 ( clk , rst , count_out);
 parameter MOD = 100;
 parameter BITS = $clog2(100);

 input clk , rst ;
 output reg [ BITS -1:0] count_out ;


 always @ ( posedge clk or posedge rst )
	begin
		if ( rst )
			begin
			 count_out <= count_out;
			 
		
			end
		else if ( count_out < MOD -1)
			begin
			 count_out <= count_out + 1;

			end
		else
			begin
			 count_out <= count_out;

			end
		
			
	end
 endmodule