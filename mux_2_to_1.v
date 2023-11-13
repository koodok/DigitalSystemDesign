module mux_2_to_1 (a, b,sw1,sw2, out);

input [7:0] a,b;
input sw1,sw2;
output reg [7:0] out;

always @ (posedge sw1 or posedge sw2)
   begin
      if (sw1)
         begin
            out <= a;
         end
      else
         begin
            out <= b;
         end
   end
endmodule