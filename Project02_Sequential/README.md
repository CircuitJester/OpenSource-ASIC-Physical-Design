# Project 02 — 4-bit Binary Counter ASIC Implementation

A complete RTL-to-GDSII implementation of a 4-bit binary counter using an open-source ASIC physical design flow.

The project starts with synthesizable Verilog RTL and takes the design through logic synthesis, floorplanning, power distribution, placement, clock-tree synthesis, routing, parasitic extraction, IR analysis, and final GDSII generation.

The physical implementation was performed using OpenROAD Flow Scripts (ORFS) with the Nangate45 standard-cell library.

---

## Design Overview

The design implements a 4-bit binary counter with an asynchronous active-high reset.

### Function

On every rising edge of `clk`:

- `rst = 1` → `q = 0000`
- `rst = 0` → `q = q + 1`
```
## ASIC Implementation Flow
