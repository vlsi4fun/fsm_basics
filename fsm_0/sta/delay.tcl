# delay calc example
read_liberty ../synth/Nangate45_typ.lib
read_verilog ../synth/synth.v
link_design fsm
create_clock -name MAIN_CLK -period 10 [get_ports clk_i]
report_checks
