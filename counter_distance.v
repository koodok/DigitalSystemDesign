module counter_distance (clk, velocity, count_out , carry_out);
 parameter MOD = 36000;//1sec(25_000_000):36_00, 0.1sec(25_00_000):36_000 , 1/3600:1000
 parameter BITS = $clog2(MOD);

 input clk;
 input [6:0] velocity;
 output reg [BITS -1:0] count_out ;
 output reg carry_out;

 always @ ( posedge clk )
   begin//1
      if (velocity)
      begin//2
         if(count_out < MOD -1)
         begin
            count_out <= count_out + velocity;
            carry_out <= 0;
         end
         else
         begin
            count_out <= 0;
            carry_out <= 1;
         end
      end//2
      else
      begin
         count_out <= count_out;
         carry_out <= 0;
      end
   end//1
 endmodule
 