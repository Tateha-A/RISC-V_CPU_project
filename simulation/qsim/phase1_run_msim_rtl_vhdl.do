transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {D:/GitWorkspace/elec374/RISC-V_CPU/RISC-V_CPU_project/register32bit.vhd}
vcom -93 -work work {D:/GitWorkspace/elec374/RISC-V_CPU/RISC-V_CPU_project/booth_alu.vhd}
vcom -93 -work work {D:/GitWorkspace/elec374/RISC-V_CPU/RISC-V_CPU_project/encoder32to5.vhd}
vcom -93 -work work {D:/GitWorkspace/elec374/RISC-V_CPU/RISC-V_CPU_project/shiftleft32.vhd}
vcom -93 -work work {D:/GitWorkspace/elec374/RISC-V_CPU/RISC-V_CPU_project/shiftright32.vhd}
vcom -93 -work work {D:/GitWorkspace/elec374/RISC-V_CPU/RISC-V_CPU_project/negate32.vhd}
vcom -93 -work work {D:/GitWorkspace/elec374/RISC-V_CPU/RISC-V_CPU_project/not32.vhd}
vcom -93 -work work {D:/GitWorkspace/elec374/RISC-V_CPU/RISC-V_CPU_project/or32.vhd}
vcom -93 -work work {D:/GitWorkspace/elec374/RISC-V_CPU/RISC-V_CPU_project/and32.vhd}
vcom -93 -work work {D:/GitWorkspace/elec374/RISC-V_CPU/RISC-V_CPU_project/rotateleft32.vhd}
vcom -93 -work work {D:/GitWorkspace/elec374/RISC-V_CPU/RISC-V_CPU_project/rotateright32.vhd}
vcom -93 -work work {D:/GitWorkspace/elec374/RISC-V_CPU/RISC-V_CPU_project/register64bit.vhd}
vcom -93 -work work {D:/GitWorkspace/elec374/RISC-V_CPU/RISC-V_CPU_project/mux32to1.vhd}
vcom -93 -work work {D:/GitWorkspace/elec374/RISC-V_CPU/RISC-V_CPU_project/lpm_add_sub0.vhd}
vcom -93 -work work {D:/GitWorkspace/elec374/RISC-V_CPU/RISC-V_CPU_project/lpm_divide0.vhd}
vcom -93 -work work {D:/GitWorkspace/elec374/RISC-V_CPU/RISC-V_CPU_project/registerR0.vhd}
vcom -93 -work work {D:/GitWorkspace/elec374/RISC-V_CPU/RISC-V_CPU_project/sel_and_encode.vhd}
vcom -93 -work work {D:/GitWorkspace/elec374/RISC-V_CPU/RISC-V_CPU_project/conff_logic.vhd}
vcom -93 -work work {D:/GitWorkspace/elec374/RISC-V_CPU/RISC-V_CPU_project/ram_initilization.vhd}
vcom -93 -work work {D:/GitWorkspace/elec374/RISC-V_CPU/RISC-V_CPU_project/ram_function_512x32.vhd}
vcom -93 -work work {D:/GitWorkspace/elec374/RISC-V_CPU/RISC-V_CPU_project/componentLib.vhd}
vcom -93 -work work {D:/GitWorkspace/elec374/RISC-V_CPU/RISC-V_CPU_project/MDR.vhd}
vcom -93 -work work {D:/GitWorkspace/elec374/RISC-V_CPU/RISC-V_CPU_project/datapath.vhd}
vcom -93 -work work {D:/GitWorkspace/elec374/RISC-V_CPU/RISC-V_CPU_project/P1_bus.vhd}
vcom -93 -work work {D:/GitWorkspace/elec374/RISC-V_CPU/RISC-V_CPU_project/alu.vhd}
vcom -93 -work work {D:/GitWorkspace/elec374/RISC-V_CPU/RISC-V_CPU_project/alu_path.vhd}
vcom -93 -work work {D:/GitWorkspace/elec374/RISC-V_CPU/RISC-V_CPU_project/control_unit.vhd}
vcom -93 -work work {D:/GitWorkspace/elec374/RISC-V_CPU/RISC-V_CPU_project/Seven_Seg_Display.vhd}

vcom -93 -work work {D:/GitWorkspace/elec374/RISC-V_CPU/RISC-V_CPU_project/P3_controlUnit_tb.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneiii -L rtl_work -L work -voptargs="+acc"  P3_controlUnit_tb

add wave *
view structure
view signals
run 9000 ns
