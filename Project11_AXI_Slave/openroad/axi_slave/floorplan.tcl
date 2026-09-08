read_lef /OpenROAD-flow-scripts/flow/platforms/nangate45/lef/NangateOpenCellLibrary.tech.lef
read_lef /OpenROAD-flow-scripts/flow/platforms/nangate45/lef/NangateOpenCellLibrary.macro.mod.lef
read_liberty /OpenROAD-flow-scripts/flow/platforms/nangate45/lib/NangateOpenCellLibrary_typical.lib

read_db /project/openroad/axi_slave/1_synth.odb
read_sdc /project/openroad/axi_slave/1_synth.sdc

initialize_floorplan \
  -utilization 30 \
  -aspect_ratio 1.0 \
  -core_space 2 \
  -site FreePDK45_38x28_10R_NP_162NW_34O

source /OpenROAD-flow-scripts/flow/platforms/nangate45/make_tracks.tcl

place_pins -hor_layers metal1 -ver_layers metal2

set ::env(TAP_CELL_NAME) TAPCELL_X1
source /OpenROAD-flow-scripts/flow/platforms/nangate45/tapcell.tcl

source /project/openroad/axi_slave/pdn.tcl


write_db /project/openroad/axi_slave/2_floorplan.odb
write_sdc -no_timestamp /project/openroad/axi_slave/2_floorplan.sdc

report_design_area
