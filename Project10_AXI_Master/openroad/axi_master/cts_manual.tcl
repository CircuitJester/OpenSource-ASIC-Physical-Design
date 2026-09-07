read_liberty /OpenROAD-flow-scripts/flow/platforms/nangate45/lib/NangateOpenCellLibrary_typical.lib
read_db /project/openroad/axi_master/orfs_results/base/3_place.odb
read_sdc /project/openroad/axi_master/orfs_results/base/3_place.sdc

source /OpenROAD-flow-scripts/flow/platforms/nangate45/setRC.tcl

clock_tree_synthesis -sink_clustering_enable

detailed_placement
estimate_parasitics -placement

report_clock_skew
report_checks -path_delay max -fields {slew cap input_pin} -digits 3
report_checks -path_delay min -fields {slew cap input_pin} -digits 3

write_db /project/openroad/axi_master/4_cts_manual.odb
write_sdc -no_timestamp /project/openroad/axi_master/4_cts_manual.sdc
