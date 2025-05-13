#Partial scan
remove_design -designs
read_file -format vhdl {../rtl/b14.vhd}
get_cells –hierarchical 
set_scan_configuration -style multiplexed_flip_flop 
set_scan_element false {
    reg2_reg[19] reg2_reg[29] reg3_reg[3] reg3_reg[0] reg3_reg[1] reg3_reg[5] reg3_reg[6] reg3_reg[7] reg3_reg[8] reg3_reg[9]
    reg3_reg[10] reg3_reg[11] reg3_reg[12] reg3_reg[13] reg3_reg[14] reg3_reg[15] reg3_reg[16] reg3_reg[17] reg3_reg[18] reg3_reg[19]
    reg2_reg[1] reg2_reg[2] reg2_reg[0] reg2_reg[30] reg2_reg[31] reg1_reg[20] reg1_reg[21] reg1_reg[22] reg1_reg[23] reg1_reg[24]
    reg1_reg[25] reg1_reg[26] reg1_reg[27] reg1_reg[28] reg0_reg[20] reg0_reg[21] reg0_reg[22] reg0_reg[23] reg0_reg[24] reg0_reg[25]
    reg0_reg[26] reg0_reg[27] reg0_reg[28] reg3_reg[2] reg3_reg[4] reg1_reg[3] reg1_reg[4] reg1_reg[5] reg1_reg[6] reg1_reg[7]
    reg1_reg[8] reg1_reg[9] reg1_reg[10] reg1_reg[11] reg1_reg[12] reg1_reg[13] reg1_reg[14] reg1_reg[15] reg1_reg[16] reg1_reg[17]
    reg1_reg[18] reg1_reg[19] reg0_reg[3] reg0_reg[4] reg0_reg[5] reg0_reg[6] reg0_reg[7] reg0_reg[8] reg0_reg[9] reg0_reg[10]
    reg0_reg[11] reg0_reg[12] reg0_reg[13] reg0_reg[14] reg0_reg[15] reg0_reg[16] reg0_reg[17] reg0_reg[18] reg0_reg[19] reg1_reg[0]
    reg1_reg[29] reg1_reg[30] reg1_reg[31] reg0_reg[0] reg0_reg[29] reg0_reg[30] reg0_reg[31] reg1_reg[1] reg1_reg[2] reg0_reg[1]
    reg0_reg[2] rd_reg wr_reg addr_reg[0] addr_reg[1] addr_reg[3] addr_reg[5] addr_reg[6] addr_reg[7] addr_reg[8]
    addr_reg[9] addr_reg[10] addr_reg[11] addr_reg[12] addr_reg[13] addr_reg[14] addr_reg[15] addr_reg[16] addr_reg[17] addr_reg[18]
    addr_reg[19] addr_reg[2] addr_reg[4] datao_reg[3] datao_reg[2] datao_reg[1] datao_reg[0] datao_reg[4] datao_reg[28] datao_reg[27]
    datao_reg[26] datao_reg[25] datao_reg[24] datao_reg[23] datao_reg[22] datao_reg[21] datao_reg[20] datao_reg[19] datao_reg[18] datao_reg[17]
    datao_reg[16] datao_reg[15] datao_reg[14] datao_reg[13] datao_reg[12] datao_reg[11] datao_reg[10] datao_reg[9] datao_reg[8] datao_reg[7]
    datao_reg[6] datao_reg[5] datao_reg[29] datao_reg[31] datao_reg[30]
}
set test_default_period 100 
set_dft_signal -view existing_dft -type ScanClock -timing {45 55} -port clock
set_dft_signal -view existing_dft -type Reset -active_state 1 -port reset
set_dft_signal -view spec -type ScanDataIn -port SERIAL_IN 
set_dft_signal -view spec -type ScanDataOut -port SERIAL_OUT 
set_dft_signal -view spec -type ScanEnable -port SCAN_EN -active_state 1 
create_test_protocol 
compile -scan 
preview_dft 
dft_drc 
set_scan_configuration -chain_count 1 
set_scan_configuration -clock_mixing no_mix 
set_scan_path chain1 -scan_data_in SERIAL_IN -scan_data_out SERIAL_OUT
insert_dft 
set_scan_state scan_existing 
report_area > reports/area_pscan.rpt 
report_timing > reports/timing_pscan.rpt 
report_power > reports/power_pscan.rpt 
report_scan_path -view existing_dft -chain all > reports/chain_pscan.rep 
report_scan_path -view existing_dft -cell all > reports/cell_pscan.rep 
change_names -hierarchy -rule verilog 
write -format verilog -hierarchy -out results/b14_pscan.vg 
write -format ddc -hierarchy -output results/b14_pscan.ddc 
write_scan_def -output results/b14_pscan.def 
set test_stil_netlist_format verilog 
write_test_protocol -output results/b14_pscan.stil 