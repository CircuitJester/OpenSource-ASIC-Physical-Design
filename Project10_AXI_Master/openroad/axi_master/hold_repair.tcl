read_liberty /OpenROAD-flow-scripts/flow/platforms/nangate45/lib/NangateOpenCellLibrary_typical.lib
read_db /project/openroad/axi_master/4_cts_manual.odb
read_sdc /project/openroad/axi_master/4_cts_manual.sdc

source /OpenROAD-flow-scripts/flow/platforms/nangate45/setRC.tcl

estimate_parasitics -placement

repair_timing \
  -hold \
  -hold_margin 0 \
  -max_buffer_percent 15 \
  -verbose

estimate_parasitics -placement

report_checks -path_delay min -fields {slew cap input_pin} -digits 3
report_checks -path_delay max -fields {slew cap input_pin} -digits 3

write_db /project/openroad/axi_master/5_hold_repaired.odb
write_sdc -no_timestamp /project/openroad/axi_master/5_hold_repaired.sdc
