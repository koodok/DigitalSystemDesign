module binary_to_bcd (binary_in, bcd_out);

input [7:0] binary_in;
output reg[7:0] bcd_out;

always@(binary_in)
   if(binary_in < 10)
      begin
         bcd_out <= binary_in;
      end
   else if(binary_in <20)
      begin
         bcd_out <= binary_in+6;
      end
   else if(binary_in <30)
      begin
         bcd_out <= binary_in+12;
      end
   else if(binary_in <40)
      begin
         bcd_out <= binary_in+18;
      end
   else if(binary_in <50)
      begin
         bcd_out <= binary_in+24;
      end
   else if(binary_in <60)
         begin
         bcd_out <= binary_in+30;
      end
   else if(binary_in <70)
         begin
         bcd_out <= binary_in+36;
      end
   else if(binary_in <80)
         begin
         bcd_out <= binary_in+42;
      end
   else if(binary_in <90)
         begin
         bcd_out <= binary_in+48;
      end
	else bcd_out <= binary_in+54;
endmodule
