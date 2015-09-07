transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Sergi/Dropbox/Q4/ARQ. COMPUTADORS/P4/Final/UnitatDeControl.vhd}

vcom -93 -work work {C:/Users/Sergi/Dropbox/Q4/ARQ. COMPUTADORS/P4/Final/simulation/modelsim/UnitatDeControl.vht}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneiv_hssi -L cycloneiv_pcie_hip -L cycloneiv -L rtl_work -L work -voptargs="+acc"  UnitatDeControl_vhd_tst

add wave *
view structure
view signals
run -all
