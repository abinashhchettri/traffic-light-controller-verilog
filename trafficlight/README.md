
# Traffic Light Controller in Verilog

## Overview

This project implements a finite state machine (FSM) based Traffic Light Controller using Verilog HDL.

The controller manages traffic flow for two directions:

* North-South (NS)
* East-West (EW)

The system cycles through Green, Yellow, and Red states according to predefined timing intervals.

---

## Files

* `trafficlight.v` — Main Verilog design
* `testbench_trafficlight.v` — Testbench for simulation
* `.gitignore` — Excludes generated files from Git tracking



## Simulation with Icarus Verilog

Compile the design:

```bash
iverilog -o sim trafficlight.v testbench_trafficlight.v
```

Run the simulation:

```bash
vvp sim
```

Open waveform in GTKWave:

```bash
gtkwave traffic_light_simulation.vcd
```

---

## Tools Used

* Verilog HDL
* Icarus Verilog
* GTKWave
* VS Code

---

## Author

Abinash Chettri
