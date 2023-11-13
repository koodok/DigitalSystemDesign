module MUX_2to1 (sel, a, b, out);

	parameter SIZE = 4;
	parameter OUTSIZE = 8;
    
   input sel;
   input [SIZE-1:0] a, b;
   output reg [OUTSIZE-1:0] out;
   
   always @ (a or b or sel)
   begin
      case(sel)
         1'b0: out = a;
         1'b1: out = b;
         //default: out = 0;
      endcase
   end
endmodule