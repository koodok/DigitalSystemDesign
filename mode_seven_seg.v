module mode_seven_seg (display, in, leading_zero);
   output reg [6:0] display;
   input [1:0] in;
   input leading_zero;
   
   parameter BLANK = 7'b111_1111;
   parameter ZERO = 7'b100_0000;
   parameter P = 7'b000_1100;
   parameter R = 7'b010_1111;
   parameter D = 7'b010_0001;
   
   always @ (in)
   if(!leading_zero)
      begin
         case (in)
         0: display = ZERO;
         1: display = P;
         2: display = R;
         3: display = D;
         
         default: display = BLANK;
         endcase
      end
      else
      begin
         case (in)
         0: display = BLANK;
         1: display = P;
         2: display = R;
         3: display = D;
         
         default: display = BLANK;
         endcase
      end 
endmodule 