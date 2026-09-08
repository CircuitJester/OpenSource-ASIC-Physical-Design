read_lef /OpenROAD-flow-scripts/flow/platforms/nangate45/lef/NangateOpenCellLibrary.tech.lef
read_lef /OpenROAD-flow-scripts/flow/platforms/nangate45/lef/NangateOpenCellLibrary.macro.mod.lef
read_liberty /OpenROAD-flow-scripts/flow/platforms/nangate45/lib/NangateOpenCellLibrary_typical.lib

read_db /project/openroad/axi_slave/3_placement.odb
read_sdc /project/openroad/axi_slave/3_placement.sdc

repair_clock_inverters

clock_tree_synthesis \
  -sink_clustering_enable \
  -buf_list CLKBUF_X1

detailed_placement
check_placement

estimate_parasitics -placement

report_clock_skew
report_checks -path_delay max -fields {slew cap input_pin} -digits 3

write_db /project/openroad/axi_slave/4_cts.odb
write_sdc -no_timestamp /project/openroad/axi_slave/4_cts.sdc
