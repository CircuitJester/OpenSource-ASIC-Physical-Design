read_db /project/openroad/spi_master/1_synth.odb

initialize_floorplan \
  -utilization 30 \
  -aspect_ratio 1.0 \
  -core_space 2 \
  -site FreePDK45_38x28_10R_NP_162NW_34O

make_tracks

write_db /project/openroad/spi_master/2_floorplan.odb
write_def /project/openroad/spi_master/2_floorplan.def
