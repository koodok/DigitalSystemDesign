module car(CLOCK_50,KEY,SW,LEDG,LEDR,HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,HEX6,HEX7);

input CLOCK_50;
input [3:0] KEY;
input [17:0] SW;
output [17:0] LEDG ;
output [17:0] LEDR ;
output [6:0] HEX0 ;
output [6:0] HEX1 ;
output [6:0] HEX2 ;
output [6:0] HEX3 ;
output [6:0] HEX4 ;
output [6:0] HEX5 ;
output [6:0] HEX6 ;
output [6:0] HEX7 ;

wire [8:0] gen_out1_w;
wire [8:0] gen_out2_w;

wire [3:0] gear_out_w;
wire [1:0] mode_out_w;
wire [7:0] binary_to_bcd_out_w;

wire [7:0] velocity_w;

wire [3:0] count_out_w;
wire [3:0] count10_out_w;
wire [3:0] countM_out_w;
wire [3:0] countM10_out_w;

wire [3:0]carry_out_w;
wire [3:0]carry10_out_w;
wire [3:0]carryM_out_w;
wire [3:0]carryM10_out_w;

// mileage (km, m)
wire gen_out_s_w;
wire [3:0] count_out_for_dis_w;
wire carry_out_for_dis_w;
clock_gen #(25_00, $clog2(25_00)) U3(.RST(SW[0]),.CLK_50Mhz(CLOCK_50),.CLK_1Hz(gen_out_s_w));
counter_distance CFORD (.clk(gen_out_s_w), .velocity(velocity_w), .count_out(count_out_for_dis_w) , .carry_out(carry_out_for_dis_w));

wire [3:0] count_out_for_kmdis_w0;
wire [3:0] count_out_for_kmdis_w1;
wire [3:0] count_out_for_kmdis_w2;
wire [3:0] count_out_for_kmdis_w3;

wire [3:0] count_out_for_mdis_w0;
wire [3:0] count_out_for_mdis_w1;
wire [3:0] count_out_for_mdis_w2;
wire [3:0] count_out_for_mdis_w3;

wire carry_out_for_kmdis_w0;
wire carry_out_for_kmdis_w1;
wire carry_out_for_kmdis_w2;

wire carry_out_for_mdis_w0;
wire carry_out_for_mdis_w1;
wire carry_out_for_mdis_w2;

wire [6:0] seg_for_dis_w;
wire [3:0] seg_for_dis_w1;
wire [3:0] seg_for_dis_w2;
wire [3:0] seg_for_dis_w3;


counter #(10, $clog2(10)) C5 ( .clk(carry_out_for_dis_w) , .rst(1'b1) , .count_out(count_out_for_mdis_w0), .carry_out(carry_out_for_mdis_w0));
counter #(10, $clog2(10)) C6 ( .clk(carry_out_for_mdis_w0) , .rst(1'b1) , .count_out(count_out_for_mdis_w1), .carry_out(carry_out_for_mdis_w1));
counter #(10, $clog2(10)) C7 ( .clk(carry_out_for_mdis_w1) , .rst(1'b1) , .count_out(count_out_for_mdis_w2), .carry_out(carry_out_for_mdis_w2));

counter #(10, $clog2(10)) C1 ( .clk(carry_out_for_mdis_w2) , .rst(1'b1) , .count_out(count_out_for_kmdis_w0), .carry_out(carry_out_for_kmdis_w0));
counter #(10, $clog2(10)) C2 ( .clk(carry_out_for_kmdis_w0) , .rst(1'b1) , .count_out(count_out_for_kmdis_w1), .carry_out(carry_out_for_kmdis_w1));
counter #(10, $clog2(10)) C3 ( .clk(carry_out_for_kmdis_w1) , .rst(1'b1) , .count_out(count_out_for_kmdis_w2), .carry_out(carry_out_for_kmdis_w2));

MUX_2to1 #(1, 1) M1 (.sel(KEY[0]), .a(1'b1), .b(1'b0), .out(seg_for_dis_w));
MUX_2to1 #(4, 8) M2 (.sel(KEY[0]), .a(count_out_for_mdis_w0), .b(count_out_for_kmdis_w0), .out(seg_for_dis_w1));
MUX_2to1 #(4, 8) M3 (.sel(KEY[0]), .a(count_out_for_mdis_w1), .b(count_out_for_kmdis_w1), .out(seg_for_dis_w2));
MUX_2to1 #(4, 8) M4 (.sel(KEY[0]), .a(count_out_for_mdis_w2), .b(count_out_for_kmdis_w2), .out(seg_for_dis_w3));

unit_seven_seg S0 (.display(HEX0), .in(seg_for_dis_w));
seven_seg S1 (.display(HEX1), .bcd_in(seg_for_dis_w1), .leading_zero(!(seg_for_dis_w2)&&!(seg_for_dis_w3)));
seven_seg S2 (.display(HEX2), .bcd_in(seg_for_dis_w2), .leading_zero(!(seg_for_dis_w3)));
seven_seg S3 (.display(HEX3), .bcd_in(seg_for_dis_w3), .leading_zero(1'b1));


// gear , velocity

clock_gen #(2500000,$clog2(2500000)) U2(.RST(SW[0]), .CLK_50Mhz(CLOCK_50), .CLK_1Hz(gen_out1_w));
accel_and_brake #(100,$clog2(100)) AC1( .clk(gen_out1_w) ,.rst(SW[1]),.accel(SW[2]),.brake(SW[3]),.gear(gear_out_w),.key2(KEY[2]),.count_out(velocity_w));


binary_to_bcd B1(.binary_in(velocity_w), .bcd_out(binary_to_bcd_out_w));
seven_seg S5(.display(HEX4), .bcd_in(binary_to_bcd_out_w[3:0]), .leading_zero(1'b0));
seven_seg S6(.display(HEX5), .bcd_in(binary_to_bcd_out_w[7:4]), .leading_zero(1'b1));

gear_set G1(.rst(SW[1]),.clutch(KEY[3]),.reverse(SW[4]), .gear_1(SW[5]), .gear_2(SW[6]), .gear_3(SW[7]), .gear_4(SW[8]), .gear_5(SW[9]), .velocity_in(velocity_w), .gear(gear_out_w));

seven_seg_decoder_mode S8(.display(HEX6), .bcd_in(gear_out_w), .leading_zero(1'b0));
gear_to_mode(.GEAR(gear_out_w),.MODE(mode_out_w));
mode_seven_seg (.display(HEX7), .in(mode_out_w), .leading_zero(1'b0));

// Indicator lights
clock_gen #(25000000,$clog2(25000000)) U4(.RST(SW[0]), .CLK_50Mhz(CLOCK_50), .CLK_1Hz(gen_out2_w));

signal_light L1(.clk_in(gen_out2_w),.rst(SW[16]),.light_out1(LEDG[7]), .light_out2(LEDG[6]));
signal_light L2(.clk_in(gen_out2_w),.rst(SW[15]),.light_out1(LEDG[0]), .light_out2(LEDG[1]));

hazard_light(.rst(KEY[1]),.light_out1(LEDG[3]),.light_out2(LEDG[4]));

seatbelt(.clk_in(gen_out2_w),.rst(SW[17]),.light_out(LEDG[5]));

// LEDG lights
link_light SR1 (.clk(gen_out1_w), .in(SW[0]), .out(LEDR[0]));
link_light SR2 (.clk(gen_out1_w), .in(SW[1]), .out(LEDR[1]));
link_light SR3 (.clk(gen_out1_w), .in(SW[2]), .out(LEDR[2]));
link_light SR4 (.clk(gen_out1_w), .in(SW[3]), .out(LEDR[3]));
link_light SR5 (.clk(gen_out1_w), .in(SW[4]), .out(LEDR[4]));
link_light SR6 (.clk(gen_out1_w), .in(SW[5]), .out(LEDR[5]));
link_light SR7 (.clk(gen_out1_w), .in(SW[6]), .out(LEDR[6]));
link_light SR8 (.clk(gen_out1_w), .in(SW[7]), .out(LEDR[7]));
link_light SR9 (.clk(gen_out1_w), .in(SW[8]), .out(LEDR[8]));
link_light SR10 (.clk(gen_out1_w), .in(SW[9]), .out(LEDR[9]));
link_light SR17 (.clk(gen_out1_w), .in(SW[16]), .out(LEDR[16]));
link_light SR18 (.clk(gen_out1_w), .in(SW[17]), .out(LEDR[17]));


endmodule

