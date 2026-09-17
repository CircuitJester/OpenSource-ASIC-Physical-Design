export DESIGN_NAME = axi_slave_top
export DESIGN_NICKNAME = axi_slave
export PLATFORM = nangate45
export SCRIPTS_DIR = /project/flow_scripts

export VERILOG_FILES = /project/yosys/asic/axi_slave_top_mapped.v
export SDC_FILE = /project/constraints/axi_slave_top.sdc

export CLOCK_PERIOD = 10.0
export CLOCK_PORT = clk

export PDN_TCL = /OpenROAD-flow-scripts/flow/platforms/nangate45/grid_strategy-M1-M4-M7.tcl

export MIN_ROUTING_LAYER = metal2
export MIN_CLK_ROUTING_LAYER = metal4
export MAX_ROUTING_LAYER = metal10

export IO_PLACER_H = metal5
export IO_PLACER_V = metal6

export DIE_AREA = 0 0 45 45
export CORE_AREA = 2 2 43 43

export PLACE_DENSITY = 0.30

export SKIP_CTS_REPAIR_TIMING = 1
export CTS_ARGS = -sink_clustering_enable

export HOLD_SLACK_MARGIN = -0.065
export OPT_POST_GRT_WNS = 0

export KLAYOUT_TECH_FILE = /OpenROAD-flow-scripts/flow/platforms/nangate45/FreePDK45.lyt
export KLAYOUT_DRC_FILE = /OpenROAD-flow-scripts/flow/platforms/nangate45/drc/FreePDK45.lydrc
