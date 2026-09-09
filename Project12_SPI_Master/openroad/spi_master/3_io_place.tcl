read_db /project/openroad/spi_master/2_floorplan.odb

place_pins -hor_layers metal5 -ver_layers metal6

write_db /project/openroad/spi_master/3_io.odb
write_def /project/openroad/spi_master/3_io.def
