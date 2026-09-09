read_db /project/openroad/spi_master/13_detailed_route.odb
read_liberty /OpenROAD-flow-scripts/flow/platforms/nangate45/lib/NangateOpenCellLibrary_typical.lib
read_sdc /project/constraints/spi_master.sdc

puts "=== FINAL ODB CHECK ==="
check_placement -verbose

puts "=== DESIGN AREA ==="
report_design_area

puts "=== CLOCK SKEW ==="
report_clock_skew

puts "=== TIMING ==="
report_checks -path_delay max -fields {slew cap input_pin} -digits 3
