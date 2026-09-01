export DESIGN_NAME = spi_slave
export PLATFORM    = nangate45

export VERILOG_FILES = /project/yosys/netlists/spi_slave_netlist.v
export SDC_FILE      = /project/constraints/spi_slave.sdc

export CORE_UTILIZATION = 18
export CORE_ASPECT_RATIO = 1
export CORE_MARGIN = 2

export PLACE_DENSITY = 0.65
export PDN_TCL = /project/openroad/spi_slave/pdn.tcl
