transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/Research\ Project_Spring\ 2017 {D:/Research Project_Spring 2017/constant.v}
vlog -vlog01compat -work work +incdir+D:/Research\ Project_Spring\ 2017 {D:/Research Project_Spring 2017/controller.v}
vlog -vlog01compat -work work +incdir+D:/Research\ Project_Spring\ 2017 {D:/Research Project_Spring 2017/cpu.v}
vlog -vlog01compat -work work +incdir+D:/Research\ Project_Spring\ 2017 {D:/Research Project_Spring 2017/registers.v}
vlog -vlog01compat -work work +incdir+D:/Research\ Project_Spring\ 2017 {D:/Research Project_Spring 2017/alu.v}
vlog -vlog01compat -work work +incdir+D:/Research\ Project_Spring\ 2017 {D:/Research Project_Spring 2017/mux.v}
vlog -vlog01compat -work work +incdir+D:/Research\ Project_Spring\ 2017 {D:/Research Project_Spring 2017/decoder.v}
vlog -vlog01compat -work work +incdir+D:/Research\ Project_Spring\ 2017 {D:/Research Project_Spring 2017/pc.v}
vlog -vlog01compat -work work +incdir+D:/Research\ Project_Spring\ 2017 {D:/Research Project_Spring 2017/instMem.v}
vlog -vlog01compat -work work +incdir+D:/Research\ Project_Spring\ 2017 {D:/Research Project_Spring 2017/memory.v}

