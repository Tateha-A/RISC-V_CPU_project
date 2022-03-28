onerror {exit -code 1}
vlib work
vlog -work work phase1.vo
vlog -work work booth_alu.vwf.vt
vsim -novopt -c -t 1ps -L cycloneiii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.booth_alu_vlg_vec_tst -voptargs="+acc"
vcd file -direction phase1.msim.vcd
vcd add -internal booth_alu_vlg_vec_tst/*
vcd add -internal booth_alu_vlg_vec_tst/i1/*
run -all
quit -f
