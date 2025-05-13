#SCOAP
read_netlist results/b14_scoap.vg -delete
read_netlist /cae/apps/data/saed32_edk-2023/lib/stdcell_lvt/verilog/saed32nm_lvt.v
run_build_model b14_scoap

