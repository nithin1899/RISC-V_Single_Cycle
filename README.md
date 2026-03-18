# RISC-V Single Cycle CPU

## Overview

This project implements a 32-bit single-cycle RISC-V processor in Verilog.
The design executes each instruction in a single clock cycle using a standard datapath architecture.

## Design

The processor includes instruction memory, register file, ALU, data memory, control unit, and immediate extension logic.
Data flows through fetch, decode, execute, memory, and write-back stages within one cycle.

## Example

x1 = 10 |
x2 = 20 |
ADD x3, x1, x2 → x3 = 30

## Datapath

<img width="5692" height="3008" alt="datapath" src="https://github.com/user-attachments/assets/b2edb6a6-43d6-4f85-b2b1-4afd6d7aa44c" />

## Run
Open Vivado->
Add design files from src->
Add testbench from tb->
Run behavioral simulation.

## Structure

src: design files |
tb: testbench |
docs: diagrams and waveform

## Author

Nithin Dayana |
Electronics Engineering, IIT BHU.
