module gear_to_mode(GEAR,MODE);

input [2:0] GEAR;
output reg [1:0] MODE;

always@(GEAR)
begin
   case(GEAR)
   0:MODE=1;
   1:MODE=3;
   2:MODE=3;
   3:MODE=3;
   4:MODE=3;
   5:MODE=3;
   6:MODE=2;
   endcase
end

endmodule