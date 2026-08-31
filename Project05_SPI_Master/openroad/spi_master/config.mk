export DESIGN_NAME = spi_master
export PLATFORM    = nangate45

export VERILOG_FILES = /project/yosys/netlists/spi_master_netlist.v
export SDC_FILE      = /project/constraints/spi_master.sdc

export CORE_UTILIZATION = 18
export CORE_ASPECT_RATIO = 1
export CORE_MARGIN = 2

export PLACE_DENSITY = 0.65
export PDN_TCL = /project/openroad/spi_master/pdn.tcl
