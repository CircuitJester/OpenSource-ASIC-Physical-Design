read_db /project/openroad/uart_controller/1_synth.odb

initialize_floorplan \
  -utilization 30 \
  -aspect_ratio 1.0 \
  -core_space 2 \
  -site FreePDK45_38x28_10R_NP_162NW_34O

make_tracks

place_pins \
  -hor_layers metal5 \
  -ver_layers metal6

write_db /project/openroad/uart_controller/2_floorplan.odb
write_def /project/openroad/uart_controller/2_floorplan.def

report_design_area
