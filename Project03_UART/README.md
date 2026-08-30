# Project 03 — Communication & Control RTL IP

## Overview

Project 03 focuses on designing reusable RTL blocks for communication and control-oriented digital systems.

The project builds on the digital logic and sequential-design fundamentals developed in the earlier projects and moves toward practical hardware IP development using Verilog.

The designs were functionally verified through simulation and then synthesized using Yosys to understand how RTL is converted into gate-level hardware.

The primary goal of this project was to develop clean synchronous RTL, understand FSM-based control, and establish a repeatable RTL-to-synthesis workflow.

---

## Objectives

- Design reusable communication and control-oriented RTL.
- Implement synchronous control logic.
- Develop FSM-based hardware controllers.
- Work with counters, registers, and timing logic.
- Verify RTL functionality through simulation.
- Synthesize RTL using Yosys.
- Generate and inspect synthesized netlists.
- Generate schematics to visualize synthesized hardware.
- Understand the relationship between RTL and gate-level implementation.

---

## Design Concepts

The project covers practical RTL concepts including:

- Finite State Machines
- Synchronous logic
- Counters
- Registers
- Shift registers
- Serial data handling
- Protocol sequencing
- Control signals
- Handshake logic
- Clocked datapaths

The individual blocks are designed with clear interfaces so that they can be reused as components in larger digital systems.

---

## Design Flow

Verilog RTL
    |
    v
RTL Simulation
    |
    v
Functional Verification
    |
    v
Yosys Synthesis
    |
    +--> Gate-Level Netlist
    |
    +--> Synthesized Schematic

---

## Tools Used

| Tool | Purpose |
|------|---------|
| Verilog | RTL design |
| Icarus Verilog | RTL simulation |
| GTKWave | Waveform analysis |
| Yosys | RTL synthesis |
| Graphviz | Schematic generation |
| Git | Version control |

---

## Verification

The RTL designs were tested using simulation and testbench-driven verification.

Verification focused on:

- Reset behavior
- Clocked operation
- State transitions
- Input/output relationships
- Protocol sequencing
- Counter behavior
- Data movement
- Boundary conditions

Waveforms were inspected using GTKWave to confirm the expected behavior of the designs.

---

## Synthesis

Yosys was used to convert the RTL into synthesized gate-level representations.

The synthesis process included:

1. RTL parsing
2. Design hierarchy analysis
3. Process conversion
4. Logic optimization
5. Technology-independent optimization
6. Technology mapping
7. Gate-level netlist generation
8. Schematic generation

The generated netlists and schematics were retained as implementation artifacts for inspection.

---

## Key Learning Outcomes

Through this project, the following concepts were reinforced:

- FSMs provide a structured method for implementing protocol controllers.
- Synchronous design requires careful handling of clock and reset behavior.
- Communication logic depends heavily on correct sequencing and timing.
- RTL structure can change considerably after synthesis optimization.
- Simulation should be used to validate behavior before relying on synthesized results.
- Reusable IP should have clear interfaces and predictable behavior.
- Counters and registers are fundamental building blocks for timing-oriented hardware.
- Synthesis provides the bridge between behavioral RTL and gate-level implementation.

---

## Project Significance

Project 03 represents the transition from basic digital logic design toward reusable RTL IP development.

Instead of focusing only on individual gates or simple sequential circuits, the project introduces hardware blocks that resemble components used inside larger digital systems.

It also establishes the RTL -> simulation -> synthesis workflow that is carried forward into the ASIC physical-design projects.

---

## Portfolio Progression

Digital Logic Fundamentals
        |
        v
Sequential Logic
        |
        v
Communication & Control RTL
        |
        v
Reusable RTL IP
        |
        v
ASIC Physical Implementation

Project 03 therefore acts as an important bridge between fundamental Verilog design and the physical implementation work introduced in later projects.

---

## Conclusion

Project 03 strengthened the practical foundation required for RTL design by combining synchronous digital design, control logic, simulation, verification, and synthesis.

The project established a reusable workflow for developing and evaluating RTL IP before moving toward physical ASIC implementation in subsequent projects.