#!/bin/bash

docker run --rm \
  -v /mnt/e/VLSI_projects_CHIP/ASIC_Tools/Project15_SDRAM_Controller:/project \
  -w /project \
  openroad/orfs:latest \
  klayout -zz \
  -r /OpenROAD-flow-scripts/flow/util/def2stream.py \
  -rd tech_file=/OpenROAD-flow-scripts/flow/platforms/nangate45/FreePDK45.lyt \
  -rd layer_map= \
  -rd in_def=/project/openroad/sdram_controller/7_detailed_route.def \
  -rd design_name=sdram_top \
  -rd in_files=/OpenROAD-flow-scripts/flow/platforms/nangate45/gds/NangateOpenCellLibrary.gds \
  -rd seal_file= \
  -rd out_file=/project/openroad/sdram_controller/sdram_top.gds
