/*module gear_to_velocity(CLOCK_50,SW,gear,velocity)

input gear;
input CLOCK_50;
input [17:0] SW;

output reg velocity;

wire v_out_1;

gear_set(.rst(SW[1]),.clutch(KEY[3]),.switch0(SW[4]), .switch1(SW[5]), .switch2(SW[6]), .switch3(SW[7]), .gear(gear_out));
clock_gen U2(.RST(SW[0]), .CLK_50Mhz(CLOCK_50), .CLK_1Hz(LEDG[8]));
velocity1 V1( .clk(LEDG[8]) ,.rst(SW[1]),.accel(SW[2]),.break(SW[3]),.count_out(v_out_1));
velocity1 V2( .clk(LEDG[8]) ,.rst(SW[1]),.accel(SW[2]),.break(SW[3]),.count_out(v_out_2));
velocity1 V3( .clk(LEDG[8]) ,.rst(SW[1]),.accel(SW[2]),.break(SW[3]),.count_out(v_out_3));
velocity1 V4( .clk(LEDG[8]) ,.rst(SW[1]),.accel(SW[2]),.break(SW[3]),.count_out(v_out_4));
velocity1 V5( .clk(LEDG[8]) ,.rst(SW[1]),.accel(SW[2]),.break(SW[3]),.count_out(v_out_5));
binary_to_bcd B1(.binary_in(ab_count_out), .bcd_out(binary_to_bcd_out));
seven_seg S5(.display(HEX4), .bcd_in(binary_to_bcd_out[3:0]), .leading_zero(1'b0));
seven_seg S6(.display(HEX5), .bcd_in(binary_to_bcd_out[7:4]), .leading_zero(1'b1));*/