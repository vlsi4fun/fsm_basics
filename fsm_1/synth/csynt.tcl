yosys -import
read_liberty -lib Nangate45_typ.lib
read_verilog ../rtl/fsm.v
hierarchy -check -top fsm
procs
opt
fsm
opt
memory
opt
techmap
opt
dfflibmap -liberty Nangate45_typ.lib
opt
abc -liberty Nangate45_typ.lib
flatten
clean -purge
write_verilog -noattr synth.v
show
