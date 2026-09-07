read_liberty /OpenROAD-flow-scripts/flow/platforms/nangate45/lib/NangateOpenCellLibrary_typical.lib

read_db /project/openroad/axi_master/4_cts_manual.odb
read_sdc /project/openroad/axi_master/4_cts_manual.sdc

source /OpenROAD-flow-scripts/flow/platforms/nangate45/setRC.tcl

set_propagated_clock [all_clocks]

pin_access

puts "=== DESIGN CHECK ==="
report_design_area
check_placement -verbose

puts "=== CLOCKS ==="
report_clock_skew

puts "=== GLOBAL ROUTE ==="
global_route -congestion_iterations 30

puts "=== ROUTING STATUS ==="
report_design_area
