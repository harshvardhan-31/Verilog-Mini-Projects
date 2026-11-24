# Verilog Mini Projects – 20 Digital Design Examples

A collection of **20 Verilog HDL mini projects** covering basic digital logic, combinational circuits, sequential circuits, counters, and simple finite-state-machine applications. Each project is organized in its own folder and includes a Verilog design file (`.v`) and a testbench (`tb_*.v`).

The projects are intended for learning, practicing RTL design, and running simulations with **Xilinx Vivado** or **Icarus Verilog**.

## Projects Included

| No. | Project | Folder | Main design file |
|---:|---|---|---|
| 01 | Logic Gates | `01_logic_gates/` | `logic_gates.v` |
| 02 | Half Adder | `02_half_adder/` | `half_adder.v` |
| 03 | Half Subtractor | `03_half_subtractor/` | `half_subtractor.v` |
| 04 | Full Adder | `04_full_adder/` | `full_adder.v` |
| 05 | Full Subtractor | `05_full_subtractor/` | `full_subtractor.v` |
| 06 | 2:1 Multiplexer | `06_mux_2to1/` | `mux_2to1.v` |
| 07 | 1:2 Demultiplexer | `07_demux_1to2/` | `demux_1to2.v` |
| 08 | 4:1 Multiplexer | `08_mux_4to1/` | `mux_4to1.v` |
| 09 | 2:4 Decoder | `09_decoder_2to4/` | `decoder_2to4.v` |
| 10 | 4:2 Priority Encoder | `10_priority_encoder_4to2/` | `priority_encoder_4to2.v` |
| 11 | 4-bit Comparator | `11_comparator_4bit/` | `comparator_4bit.v` |
| 12 | 4-bit Ripple Carry Adder | `12_ripple_carry_adder_4bit/` | `ripple_carry_adder_4bit.v` |
| 13 | 4-bit Adder-Subtractor | `13_adder_subtractor_4bit/` | `adder_subtractor_4bit.v` |
| 14 | 8-bit ALU | `14_alu_8bit/` | `alu_8bit.v` |
| 15 | Flip-Flops (D, T, JK, SR) | `15_flip_flops/` | `flip_flops.v` |
| 16 | Shift Registers (SISO, SIPO, PISO, PIPO) | `16_shift_registers/` | `shift_registers.v` |
| 17 | Counters (Up, Up/Down, Mod-10) | `17_counters/` | `counters.v` |
| 18 | Traffic Light FSM | `18_traffic_light_fsm/` | `traffic_light_fsm.v` |
| 19 | Vending Machine | `19_vending_machine/` | `vending_machine.v` |
| 20 | Digital Clock | `20_digital_clock/` | `digital_clock.v` |

## Repository Structure

Each project folder contains its design source and its corresponding testbench. For example:

```text
01_logic_gates/
├── logic_gates.v
└── tb_logic_gates.v
```

The same naming pattern is used for the other projects.

## Tools Required

- **Xilinx Vivado** – to add the design and testbench files and run behavioral simulation.
- **Icarus Verilog** – an alternative simulator for compiling and running the testbenches.

## Run a Simulation with Icarus Verilog

1. Install Icarus Verilog and open a terminal in the repository folder.
2. Move into the project folder you want to simulate.
3. Compile the design file together with its testbench.
4. Run the generated simulation executable.

Example – Logic Gates:

```bash
cd 01_logic_gates
iverilog -o sim logic_gates.v tb_logic_gates.v
vvp sim
```

For another project, use that folder's design and testbench filenames. For example, for the half adder:

```bash
cd 02_half_adder
iverilog -o sim half_adder.v tb_half_adder.v
vvp sim
```

## Run a Simulation with Xilinx Vivado

1. Open Vivado and create or open a Verilog project.
2. Add the selected project's design file (`.v`) as a **Design Source**.
3. Add its testbench file (`tb_*.v`) as a **Simulation Source**.
4. Set the testbench as the simulation top if Vivado does not select it automatically.
5. Select **Run Simulation → Run Behavioral Simulation**.
6. Review the simulation output and waveform.

Repeat these steps for each project you want to simulate.

## Learning Areas

- Basic logic gates and Boolean logic
- Adders, subtractors, and arithmetic circuits
- Multiplexers, demultiplexers, decoders, and encoders
- Comparators and arithmetic logic units
- Flip-flops and shift registers
- Counters and sequential logic
- Finite-state-machine-based applications

## About This Repository

This repository is a hands-on collection of Verilog mini projects for digital electronics, RTL design, and simulation practice. Each project is kept separate to make it easy to explore, compile, and test independently.

---

**Author:** [harshvardhan-31](https://github.com/harshvardhan-31)
