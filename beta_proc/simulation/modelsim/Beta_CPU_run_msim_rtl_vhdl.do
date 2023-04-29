transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -2008 -work work {C:/Users/lakij/OneDrive/Dokumenti/beta/beta_proc/src/vhd/register_mux.vhd}
vcom -2008 -work work {C:/Users/lakij/OneDrive/Dokumenti/beta/beta_proc/src/vhd/register_zero.vhd}
vcom -2008 -work work {C:/Users/lakij/OneDrive/Dokumenti/beta/beta_proc/src/vhd/registers.vhd}
vcom -2008 -work work {C:/Users/lakij/OneDrive/Dokumenti/beta/beta_proc/src/vhd/register_file.vhd}

vcom -2008 -work work {C:/Users/lakij/OneDrive/Dokumenti/beta/beta_proc/src/vhd/control_unit_tb.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L fiftyfivenm -L rtl_work -L work -voptargs="+acc"  control_unit_tb

add wave *
view structure
view signals
run 1 us
