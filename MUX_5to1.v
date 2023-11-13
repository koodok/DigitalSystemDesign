module MUX_5to1 (sel, a, b, c, d, e, out);
    
   input [2:0] sel;
   input [7:0] a, b, c, d, e;
   output reg [7:0] out;
   
   always @ (a or b or c or d or e or sel)
   begin
      case(sel)
         2'b001: out = a; //1
         2'b010: out = b; //2
         2'b011: out = c; //3
         2'b100: out = d; //4
         2'b101: out = e; //5
         //default: out = 0;
      endcase   
   end
endmodule