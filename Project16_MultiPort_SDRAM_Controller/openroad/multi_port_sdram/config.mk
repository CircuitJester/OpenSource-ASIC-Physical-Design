export DESIGN_NAME = multi_port_sdram_top
export DESIGN_NICKNAME = multi_port_sdram
export PLATFORM = nangate45

export VERILOG_FILES = /project/yosys/asic/multi_port_sdram_top_mapped.v
export SDC_FILE = /project/constraints/multi_port_sdram_top.sdc

export PLACE_DENSITY = 0.30

export CLOCK_PERIOD = 10.0
export CLOCK_PORT = clk

export PDN_TCL = /OpenROAD-flow-scripts/flow/platforms/nangate45/grid_strategy-M1-M4-M7.tcl

export MIN_ROUTING_LAYER = metal2
export MIN_CLK_ROUTING_LAYER = metal4
export MAX_ROUTING_LAYER = metal10

export IO_PLACER_H = metal5
export IO_PLACER_V = metal6

export DETAILED_ROUTE_ARGS =
export KLAYOUT_TECH_FILE = /OpenROAD-flow-scripts/flow/platforms/nangate45/FreePDK45.lyt
export KLAYOUT_DRC_FILE = /OpenROAD-flow-scripts/flow/platforms/nangate45/drc/FreePDK45.lydrc


export DIE_AREA = 0 0 35 35
export CORE_AREA = 2 2 33 33

export SKIP_CTS_REPAIR_TIMING = 1
export CTS_ARGS = -sink_clustering_enable
