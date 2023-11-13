module counter ( clk , rst , count_out , carry_out );
 parameter MOD = 10;
 parameter BITS = 4;

 input clk , rst ;
 output reg [ BITS -1:0] count_out ;
 output reg carry_out ;


 always @ ( posedge clk or negedge rst )
	begin
		if ( !rst )
			begin
			 count_out <= 0;
			 
			 carry_out <= 0;
			end
		else if ( count_out < MOD -1)
			begin
			 count_out <= count_out + 1;
			 carry_out <= 0;
			end
		else
			begin
			 count_out <= 0;
			 carry_out <= 1;
			end
	end
 endmodule