module seatbelt(clk_in,rst,light_out);

input clk_in,rst;
output reg light_out;

always@(clk_in)
begin
   if(rst)
      begin
      light_out <= 0;
      end
   else
      begin
      light_out <= clk_in;
      end
end

endmodule