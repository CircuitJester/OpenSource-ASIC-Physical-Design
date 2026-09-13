read_liberty /OpenROAD-flow-scripts/flow/platforms/nangate45/lib/NangateOpenCellLibrary_typical.lib
read_db /project/openroad/sdram_controller/results/nangate45/sdram_controller/base/4_1_cts.odb
read_sdc /project/openroad/sdram_controller/results/nangate45/sdram_controller/base/4_cts.sdc

source /OpenROAD-flow-scripts/flow/platforms/nangate45/setRC.tcl

estimate_parasitics -placement

puts "===== POST-CTS CLOCK ====="
report_clock_skew

puts "===== POST-CTS SETUP ====="
report_checks -path_delay max -fields {slew cap input nets fanout} -digits 3

puts "===== POST-CTS HOLD ====="
report_checks -path_delay min -fields {slew cap input nets fanout} -digits 3

puts "===== POST-CTS AREA ====="
report_design_area
