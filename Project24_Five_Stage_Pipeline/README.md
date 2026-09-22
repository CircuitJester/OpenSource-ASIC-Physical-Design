# Project 24 — Five-Stage Pipeline

## Overview

This project implements a five-stage pipeline structure using pipeline registers and a control unit. It demonstrates how data and control signals move between stages and how stalls and flushes are handled.

The stages represented are Instruction Fetch (IF), Instruction Decode (ID), Execute (EX), Memory (MEM), and Write Back (WB).

**Scope:** This is a pipeline-register and control integration project, not a complete processor core. Execute results, store data, zero status, and memory read data are supplied through top-level inputs.

## RTL Modules

- `if_id_pipeline_register` — transfers fetch-stage data to decode.
- `id_ex_pipeline_register` — transfers decoded data and control signals to execute.
- `ex_mem_pipeline_register` — transfers execute results and control signals to memory.
- `mem_wb_pipeline_register` — transfers memory-stage data and control signals to write back.
- `pipeline_control_unit` — generates PC/IF-ID write enables and ID/EX flush control.
- `pipelined_alu_top` — integrates the pipeline registers and control logic.

## Functional Behavior

During normal operation, the PC and IF/ID write enables are active and ID/EX flush is deasserted.

A flush request asserts `id_ex_flush`. When a stall is requested without a flush, PC and IF/ID writes are disabled and ID/EX is flushed. Refer to the RTL for exact signal definitions and control priority.

## Verification

Six testbenches are included:

- `tb_if_id_pipeline_register`
- `tb_id_ex_pipeline_register`
- `tb_ex_mem_pipeline_register`
- `tb_mem_wb_pipeline_register`
- `tb_pipeline_control_unit`
- `tb_pipelined_alu_top`

The testbenches exercise pipeline-register behavior, control logic, and top-level integration. See `commands.md` for simulation commands.

## Synthesis Results

Yosys RTL checks and Nangate45 mapping were completed.

| Metric | Result |
|---|---:|
| Mapped standard-cell instances | 236 |
| Mapped cell area | 655.424 µm² |
| Sequential cell area | 529.074 µm² |
| Sequential area fraction | 80.72% |
| AND2_X1 cells | 117 |
| DFF_X1 cells | 117 |
| NOR2_X1 cells | 1 |
| NOR3_X1 cells | 1 |

The mapped netlist and synthesis logs are stored in `yosys/asic/`.

## Physical-Design Results

The OpenROAD flow progressed through detailed routing and generated physical-design artifacts.

| Metric | Result |
|---|---:|
| Reported design area | 844 µm² |
| Reported utilization | 11% |
| Total routed wire length | 4325 µm |
| Metal2 wire length | 1446 µm |
| Metal3 wire length | 1740 µm |
| Metal4 wire length | 345 µm |
| Metal5 wire length | 478 µm |
| Metal6 wire length | 314 µm |
| Via count | 2163 |
| Detailed-route violations | 0 |
| OpenROAD antenna net violations | 0 |
| OpenROAD antenna pin violations | 0 |

### Flow Limitation

The final reporting stage did not complete successfully. The `6_report` stage stopped with an illegal-instruction error in `final_report.tcl`. Detailed routing completed, but this project should not be described as having completed full signoff.

## Technology and Licensing

The physical-design flow uses the Nangate45 platform. The local Nangate45 Liberty file is excluded from version control because its licensing and redistribution terms require review. Use the library only in accordance with its applicable license.

## Important Files

- `rtl/` — synthesizable RTL modules.
- `tb/` — simulation testbenches.
- `yosys/asic/` — Yosys scripts, logs, and mapped netlist.
- `synth/schematics/` — schematic visualization.
- `liberty/` — local technology library, excluded from Git.
- `commands.md` — commands for simulation, synthesis, and the OpenROAD flow.

## Reproduction

Refer to `commands.md` for the workflow commands.

If you find this project useful, consider giving the repository a star.
