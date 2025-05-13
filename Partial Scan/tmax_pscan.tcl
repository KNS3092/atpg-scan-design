# Test compression
read_netlist results/b14_pscan.vg -delete
read_netlist /cae/apps/data/saed32_edk-2023/lib/stdcell_lvt/verilog/saed32nm_lvt.v
run_build_model b14
set_drc results/b14_pscan.stil
run_drc
remove_faults -all
add_faults -all 
set_faults -fault_coverage  
set_atpg -abort 100 -merge high
run_atpg -auto_compression 
write_patterns b14_pattern_pscan.v -internal -format binary