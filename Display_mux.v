/*
module Display_mux(MODE, out_seg);

input [1:0] MODE;
output reg [3:0] out_seg;

always @(MODE)

begin

 case (MODE)

  0 : out_seg <= AC_seg;

  1 : out_seg <= BK_seg; 

 endcase

end

endmodule
*/