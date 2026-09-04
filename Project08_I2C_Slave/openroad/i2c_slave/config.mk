export DESIGN_NAME = i2c_slave
export PLATFORM    = nangate45

export VERILOG_FILES = /project/yosys/netlists/i2c_slave_netlist.v
export SDC_FILE      = /project/constraints/i2c_slave.sdc

export CORE_UTILIZATION = 18
export CORE_ASPECT_RATIO = 1
export CORE_MARGIN = 2

export PLACE_DENSITY = 0.65
export PDN_TCL = /project/openroad/i2c_slave/pdn.tcl
