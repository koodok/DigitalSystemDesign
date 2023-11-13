transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/car {C:/altera/13.0sp1/car/counter.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/car {C:/altera/13.0sp1/car/car.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/car {C:/altera/13.0sp1/car/seven_seg.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/car {C:/altera/13.0sp1/car/clock_gen.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/car {C:/altera/13.0sp1/car/binary_to_bcd.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/car {C:/altera/13.0sp1/car/gear_set.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/car {C:/altera/13.0sp1/car/mode_seven_seg.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/car {C:/altera/13.0sp1/car/link_light.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/car {C:/altera/13.0sp1/car/signal_light.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/car {C:/altera/13.0sp1/car/hazard_light.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/car {C:/altera/13.0sp1/car/gear_to_mode.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/car {C:/altera/13.0sp1/car/seatbelt.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/car {C:/altera/13.0sp1/car/accel_and_brake.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/car {C:/altera/13.0sp1/car/counter_distance.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/car {C:/altera/13.0sp1/car/MUX_2to1.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/car {C:/altera/13.0sp1/car/unit_seven_seg.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/car {C:/altera/13.0sp1/car/seven_seg_decoder_mode.v}

