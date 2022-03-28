transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vcom -93 -work work {phase1.vho}

vcom -93 -work work {D:/GitWorkspace/elec374/elec374project/ld_R1_85_tb.vhd}

vsim -t 1ps -L altera -L cycloneiii -L gate_work -L work -voptargs="+acc"  ld_R1_85_tb

add wave *
view structure
view signals
run 500 ns
