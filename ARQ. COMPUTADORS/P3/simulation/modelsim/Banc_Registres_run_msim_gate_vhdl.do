transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vcom -93 -work work {Banc_Registres_6_1200mv_85c_slow.vho}

vcom -93 -work work {/home/enric/Dropbox/CURS 2/Q. 4/ARQ. COMPUTADORS/P3/simulation/modelsim/BancRegistres.vht}

vsim -t 1ps +transport_int_delays +transport_path_delays -sdftyp /i1=Banc_Registres_6_1200mv_85c_vhd_slow.sdo -L altera_mf -L altera -L lpm -L sgate -L cycloneiv_hssi -L cycloneiv_pcie_hip -L cycloneiv -L gate_work -L work -voptargs="+acc"  BancRegistres_vhd_tst

add wave *
view structure
view signals
run -all
