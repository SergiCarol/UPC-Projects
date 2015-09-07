transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Sergi/Dropbox/Q4/ARQ. COMPUTADORS/P5/arq/RegistreZero.vhd}
vcom -93 -work work {C:/Users/Sergi/Dropbox/Q4/ARQ. COMPUTADORS/P5/arq/ComptadorPrograma.vhd}
vcom -93 -work work {C:/Users/Sergi/Dropbox/Q4/ARQ. COMPUTADORS/P5/arq/UnitatDeControl.vhd}
vcom -93 -work work {C:/Users/Sergi/Dropbox/Q4/ARQ. COMPUTADORS/P5/arq/RegSortida3Estats.vhd}
vcom -93 -work work {C:/Users/Sergi/Dropbox/Q4/ARQ. COMPUTADORS/P5/arq/RegistreMDR.vhd}
vcom -93 -work work {C:/Users/Sergi/Dropbox/Q4/ARQ. COMPUTADORS/P5/arq/RegistreMAR.vhd}
vcom -93 -work work {C:/Users/Sergi/Dropbox/Q4/ARQ. COMPUTADORS/P5/arq/Registre.vhd}
vcom -93 -work work {C:/Users/Sergi/Dropbox/Q4/ARQ. COMPUTADORS/P5/arq/Programes.vhd}
vcom -93 -work work {C:/Users/Sergi/Dropbox/Q4/ARQ. COMPUTADORS/P5/arq/PCSUP.vhd}
vcom -93 -work work {C:/Users/Sergi/Dropbox/Q4/ARQ. COMPUTADORS/P5/arq/Mux4a1_5Bits.vhd}
vcom -93 -work work {C:/Users/Sergi/Dropbox/Q4/ARQ. COMPUTADORS/P5/arq/Microprocessador.vhd}
vcom -93 -work work {C:/Users/Sergi/Dropbox/Q4/ARQ. COMPUTADORS/P5/arq/Latch32Bits.vhd}
vcom -93 -work work {C:/Users/Sergi/Dropbox/Q4/ARQ. COMPUTADORS/P5/arq/ExtensioDeSigne.vhd}
vcom -93 -work work {C:/Users/Sergi/Dropbox/Q4/ARQ. COMPUTADORS/P5/arq/EnllacBus.vhd}
vcom -93 -work work {C:/Users/Sergi/Dropbox/Q4/ARQ. COMPUTADORS/P5/arq/DespExtSign15a0.vhd}
vcom -93 -work work {C:/Users/Sergi/Dropbox/Q4/ARQ. COMPUTADORS/P5/arq/Desp25a0.vhd}
vcom -93 -work work {C:/Users/Sergi/Dropbox/Q4/ARQ. COMPUTADORS/P5/arq/Descodificador5.vhd}
vcom -93 -work work {C:/Users/Sergi/Dropbox/Q4/ARQ. COMPUTADORS/P5/arq/BancRegistres.vhd}
vcom -93 -work work {C:/Users/Sergi/Dropbox/Q4/ARQ. COMPUTADORS/P5/arq/ALU32.vhd}
vcom -93 -work work {C:/Users/Sergi/Dropbox/Q4/ARQ. COMPUTADORS/P5/arq/Acumulador.vhd}
vcom -93 -work work {C:/Users/Sergi/Dropbox/Q4/ARQ. COMPUTADORS/P5/arq/RAMSin.vhd}

vcom -93 -work work {C:/Users/Sergi/Dropbox/Q4/ARQ. COMPUTADORS/P5/arq/simulation/modelsim/Microprocessador.vht}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneiv_hssi -L cycloneiv_pcie_hip -L cycloneiv -L rtl_work -L work -voptargs="+acc"  Microprocessador_vhd_tst

add wave *
view structure
view signals
run -all
