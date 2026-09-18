export DESIGN_NICKNAME = dma
export DESIGN_NAME = dma_top

export PLATFORM = nangate45

export VERILOG_FILES = $(DESIGN_HOME)/src/$(DESIGN_NICKNAME)/dma_top_mapped.v

export SDC_FILE = $(DESIGN_HOME)/src/$(DESIGN_NICKNAME)/dma_top.sdc

export PLACE_DENSITY = 0.30

export DIE_AREA = 0 0 55 55
export CORE_AREA = 2 2 53 53

export CLOCK_PERIOD = 10.0

export SKIP_CTS_REPAIR_TIMING = 1
export CTS_ARGS = -sink_clustering_enable

export OPT_POST_GRT_WNS = 0


export HOLD_SLACK_MARGIN = -0.05
