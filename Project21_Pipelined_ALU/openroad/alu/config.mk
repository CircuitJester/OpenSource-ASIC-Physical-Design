export DESIGN_NICKNAME = alu
export DESIGN_NAME = pipelined_alu_top
export PLATFORM = nangate45

export VERILOG_FILES = $(DESIGN_HOME)/src/alu/pipelined_alu_top_mapped.v
export SDC_FILE = $(DESIGN_HOME)/src/alu/pipelined_alu_top.sdc

export PLACE_DENSITY = 0.30
export DIE_AREA = 0 0 45 45
export CORE_AREA = 2 2 43 43

export CLOCK_PERIOD = 10.0

export SKIP_CTS_REPAIR_TIMING = 1
export CTS_ARGS = -sink_clustering_enable
export OPT_POST_GRT_WNS = 0
export HOLD_SLACK_MARGIN = -0.05
