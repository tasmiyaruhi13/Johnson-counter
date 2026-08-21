# 4-Bit Johnson Counter using Verilog

## Overview

This project implements a **4-bit Johnson Counter** using Verilog HDL.

A Johnson counter, also called a **twisted-ring counter**, is a shift register in which the inverted output of the last flip-flop is fed back to the input of the first flip-flop.

For a 4-bit Johnson counter, the circuit produces 8 unique states.

## Johnson Counter Sequence

The counter follows this sequence:

```text
0000
1000
1100
1110
1111
0111
0011
0001
0000
```

After reaching `0001`, the counter returns to `0000` and the sequence repeats.

## Features

* 4-bit Johnson Counter
* Verilog HDL implementation
* Asynchronous active-high reset
* Verilog testbench
* Simulation output
* VCD waveform generation
* Icarus Verilog compatible
* GTKWave compatible
* Makefile for easy simulation

## Project Structure

```text
johnson-counter-verilog/
├── rtl/
│   └── johnson_counter.v
├── tb/
│   └── tb_johnson_counter.v
├── simulation/
│   └── simulation_output.txt
├── README.md
└── Makefile
```

## Working Principle

A Johnson counter is constructed using a shift register.

For a 4-bit counter:

```text
q[3] <= ~q[0]
q[2] <= q[3]
q[1] <= q[2]
q[0] <= q[1]
```

The inverted value of the last bit is fed back into the first bit.

Starting from:

```text
0000
```

the counter progresses as:

```text
0000 → 1000 → 1100 → 1110
      → 1111 → 0111 → 0011 → 0001
      → 0000
```

Therefore, a 4-bit Johnson counter has:

```text
2 × 4 = 8 unique states
```

## RTL Design

The main design is located at:

```text
rtl/johnson_counter.v
```

### Inputs

| Signal  | Description                    |
| ------- | ------------------------------ |
| `clk`   | Clock input                    |
| `reset` | Active-high asynchronous reset |

### Output

| Signal   | Description                  |
| -------- | ---------------------------- |
| `q[3:0]` | 4-bit Johnson counter output |

## Reset Operation

When:

```text
reset = 1
```

the counter is reset to:

```text
q = 0000
```

When reset is released, the counter begins changing state on every rising edge of the clock.

## Testbench

The testbench is located at:

```text
tb/tb_johnson_counter.v
```

The testbench performs the following operations:

1. Generates a 10 ns clock.
2. Applies reset.
3. Releases reset.
4. Monitors the counter output.
5. Generates a VCD waveform.
6. Displays simulation results.
7. Stops the simulation.

## Simulation

### Compile

Using Icarus Verilog:

```bash
iverilog -o johnson_counter_sim rtl/johnson_counter.v tb/tb_johnson_counter.v
```

### Run

```bash
vvp johnson_counter_sim
```

### View Waveform

The testbench generates:

```text
johnson_counter.vcd
```

Open it using:

```bash
gtkwave johnson_counter.vcd
```

Add these signals to the waveform:

```text
clk
reset
q
```

## Expected Simulation Result

The output should follow:

```text
0000
1000
1100
1110
1111
0111
0011
0001
0000
```

This confirms that the Johnson counter is operating correctly.

## Simulation Output

Example:

```text
========================================
       4-BIT JOHNSON COUNTER TEST
========================================
Time    Reset   Q
----------------------------------------
0       1       0000
12000   0       0000
15000   0       1000
25000   0       1100
35000   0       1110
45000   0       1111
55000   0       0111
65000   0       0011
75000   0       0001
85000   0       0000
95000   0       1000
105000  0       1100
----------------------------------------
Simulation completed successfully.
```

## Waveform

The expected waveform demonstrates the eight-state Johnson counter sequence:

```text
0000 → 1000 → 1100 → 1110
     → 1111 → 0111 → 0011 → 0001
     → 0000
```

## Applications

Johnson counters are commonly used in:

* Sequence generation
* Timing circuits
* Frequency division
* Digital control circuits
* LED sequencing
* State generation
* Counter and decoder circuits

## Advantages

* Simple hardware implementation
* Generates 2N states using N flip-flops
* Easy to decode
* Useful for timing and sequencing applications

## Tools Used

* Verilog HDL
* Icarus Verilog
* GTKWave
* Git/GitHub

## Result

**PASS — The 4-bit Johnson Counter successfully generates all 8 states and repeats the sequence correctly.**

## Author

```text
Name: Your Name
Department: Your Department
College: Your College
```

## License

This project is intended for educational and academic purposes.
