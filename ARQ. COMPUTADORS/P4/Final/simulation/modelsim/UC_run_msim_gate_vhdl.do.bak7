transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vcom -93 -work work {UC_6_1200mv_85c_slow.vho}

vcom -93 -work work {C:/Users/Sergi/Dropbox/Q4/ARQ. COMPUTADORS/P4/Final/simulation/modelsim/UC_simbol.vht}

vsim -t 1ps +transport_int_delays +transport_path_delays -sdftyp /i1=UC_6_1200mv_85c_vhd_slow.sdo -L altera_mf -L altera -L lpm -L sgate -L cycloneiv_hssi -L cycloneiv_pcie_hip -L cycloneiv -L gate_work -L work -voptargs="+acc"  UC_simbol_vhd_tst

add wave *
view structure
view signals
run -all
