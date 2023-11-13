module mux_2_to_1 (a, b, out, outbar, sel);

input a, b, sel;
output out, outbar;
reg out, outbar;

always@(a or b or sel)
begin
   
	if (sel) out = a;
   else out = b;
   outbar = ~out;
   
   end   
endmodule