read_db /project/openroad/uart_controller/2_floorplan.odb

read_liberty /OpenROAD-flow-scripts/flow/platforms/nangate45/lib/NangateOpenCellLibrary_typical.lib

insert_tiecells LOGIC0_X1/Z -prefix TIE_ZERO_
insert_tiecells LOGIC1_X1/Z -prefix TIE_ONE_

write_db /project/openroad/uart_controller/3_tie_cells.odb
write_def /project/openroad/uart_controller/3_tie_cells.def
