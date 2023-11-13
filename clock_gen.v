module clock_gen(RST,CLK_50Mhz,CLK_1Hz);
 parameter MOD = 1000000;
 parameter BITS = $clog2(MOD);
 
 input CLK_50Mhz;
 input RST;
 output CLK_1Hz;
 
 wire CLK_2Hz;
 
 counter #(MOD,BITS) U1(.clk(CLK_50Mhz), .rst(RST), .carry_out(CLK_2Hz));
 counter #(2,1) U2(.clk(CLK_2Hz), .rst(RST), .carry_out(CLK_1Hz));
 
 
 
 endmodule
