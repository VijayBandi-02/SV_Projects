# Introduction

This project implements a SystemVerilog-based verification environment for a Memory DUT (Design Under Test).
The verification architecture follows a modular testbench methodology including:

- Generator
- Driver / BFM
- Monitor
- Scoreboard
- Coverage
- Assertions
- Environment
- Agent

The objective is to verify correct memory read/write functionality using constrained/random stimulus and functional checking.

# Folder Structure

Memory_Verification_Project/
│
├── - 'mem.sv/'              → Memory DUT
├── - 'mem_agent.sv/'        → Agent containing BFM, Monitor, Generator
├── - 'mem_assert.sv/'       → SystemVerilog Assertions
├── - 'mem_BFM.sv/'          → Bus Functional Model / Driver
├── - 'mem_common.sv/'       → Common parameters & definitions
├── - 'mem_cov.sv/'          → Functional coverage collection
├── - 'mem_env.sv/'          → Verification environment
├── - 'mem_gen.sv/'          → Stimulus generator
├── - 'mem_intrf.sv/'        → Interface definition
├── - 'mem_list.svh/'        → Include file list
├── - 'mem_mon.sv/'          → Monitor
├── - 'mem_run.do/'          → ModelSim run script
├── - 'mem_sbd.sv/'          → Scoreboard
├── - 'mem_TB.sv/'           → Top-level testbench
└── - 'README.md/'           → Documentation

# Verification Components
## DUT (mem.sv)
Implements memory functionality with:
- Read operation
- Write operation
- Address decoding
- Data storage

## Generator (mem_gen.sv)
Generates:
- Randomized transactions
- Read/write sequences
- Stimulus packets

## BFM / Driver (mem_BFM.sv)
Drives generated transactions to the DUT through the interface.
Responsibilities:
- Apply input signals
- Synchronize with clock
- Handle protocol timing

## Monitor (mem_mon.sv)
Observes DUT activity and captures:
- Read data
- Write data
- Address transactions

## Scoreboard (mem_sbd.sv)
Performs functional checking:
- Expected vs actual comparison
- Error reporting
- Transaction validation

## Coverage (mem_cov.sv)
Collects functional coverage for:
- Address coverage
- Read/write operation coverage
- Data patterns

## Assertions (mem_assert.sv)
SystemVerilog Assertions used for:
- Protocol checking
- Timing verification
- Illegal condition detection

## Environment (mem_env.sv)
Connects all verification components together.

## Agent (mem_agent.sv)
Encapsulates:
- Generator
- Driver/BFM
- Monitor
Provides modularity and reusability.

# Simulation Steps (Synapsys):
- do mem_run.do

# Learning Outcome
Through this project, the following DV concepts are practiced:
- Building layered verification environments
- Verification component communication
- Functional checking and coverage
- Assertion-based verification
- Scalable SystemVerilog testbench design

# Author
Vijay Bandi
ECE Graduate 2025
VLSI Design Verification Trainee
SystemVerilog | Verilog | Assertions | Functional Coverage
