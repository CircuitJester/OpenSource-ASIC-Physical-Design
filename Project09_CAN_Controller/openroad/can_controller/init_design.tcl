read_lef /OpenROAD-flow-scripts/flow/platforms/nangate45/lef/NangateOpenCellLibrary.tech.lef
read_lef /OpenROAD-flow-scripts/flow/platforms/nangate45/lef/NangateOpenCellLibrary.macro.mod.lef

read_liberty /OpenROAD-flow-scripts/flow/platforms/nangate45/lib/NangateOpenCellLibrary_typical.lib

read_verilog /project/yosys/asic/can_controller_mapped.v
link_design can_controller

read_sdc /project/constraints/can_controller.sdc

report_design_area
report_checks -path_delay max -fields {slew cap input_pin} -digits 3

write_db /project/openroad/can_controller/1_synth.odb
write_sdc /project/openroad/can_controller/1_synth.sdc
