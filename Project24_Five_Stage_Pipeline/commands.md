# Project 24 — Commands

Run the following commands from the ASIC_Tools repository root unless otherwise stated.

## Simulation

Enter the project and create output directories:

    cd /mnt/e/VLSI_projects_CHIP/ASIC_Tools/Project24_Five_Stage_Pipeline
    mkdir -p sim waves

Compile and run each testbench:

    iverilog -g2012 -s tb_if_id_pipeline_register -o sim/if_id.out rtl/*.v tb/tb_if_id_pipeline_register.v
    vvp sim/if_id.out

    iverilog -g2012 -s tb_id_ex_pipeline_register -o sim/id_ex.out rtl/*.v tb/tb_id_ex_pipeline_register.v
    vvp sim/id_ex.out

    iverilog -g2012 -s tb_ex_mem_pipeline_register -o sim/ex_mem.out rtl/*.v tb/tb_ex_mem_pipeline_register.v
    vvp sim/ex_mem.out

    iverilog -g2012 -s tb_mem_wb_pipeline_register -o sim/mem_wb.out rtl/*.v tb/tb_mem_wb_pipeline_register.v
    vvp sim/mem_wb.out

    iverilog -g2012 -s tb_pipeline_control_unit -o sim/control.out rtl/*.v tb/tb_pipeline_control_unit.v
    vvp sim/control.out

    iverilog -g2012 -s tb_pipelined_alu_top -o sim/top.out rtl/*.v tb/tb_pipelined_alu_top.v
    vvp sim/top.out

## GTKWave

Open a generated waveform with:

    gtkwave waves/<waveform_name>.vcd

Replace the placeholder with the VCD filename produced by the testbench.

## Yosys Synthesis

Run the Nangate45 mapping script:

    yosys -s yosys/asic/map_nangate45.ys

The required Nangate45 Liberty file must be available locally and used according to its license. It is intentionally excluded from Git.

Remove generated DOT intermediates when appropriate:

    rm -f synth/schematics/*.dot

## OpenROAD

Run the finish flow using the OpenROAD-flow-scripts Docker environment:

    cd /mnt/e/OpenSource-ASIC/OpenROAD-flow-scripts
    flow/util/docker_shell -- make DESIGN_CONFIG=/work/flow/designs/nangate45/pipelined_alu_top/config.mk finish

The final reporting stage previously stopped with an illegal-instruction error. Detailed routing completed, but this should not be treated as a successful full-signoff run.

## Git Checks

Return to the repository root:

    cd /mnt/e/VLSI_projects_CHIP/ASIC_Tools

Review the staged changes:

    git status --short
    git diff --cached --check
    git diff --cached --stat

Only stage Project 24 files for the Project 24 commit. Do not stage `Project22_Hazard_Detection_Unit/` as part of this change.
