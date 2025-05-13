# Test compression 
remove_faults -all
add_faults -all 
set_faults -fault_coverage  
set_atpg -abort 100 -merge high
run_atpg -auto_compression 
write_patterns b14_pattern_fullscan.v -internal -format binary


# No compression
# remove_faults -all
# add_faults -all 
# set_faults -fault_coverage  
# run_atpg -auto 
# write_patterns b14_pattern_fullscan.v -internal -format binary