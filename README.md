# CAV 2023

# Online Causation Monitoring of Signal Temporal Logic

## System requirement

- Operating system: Linux or MacOS;

- Matlab (Simulink/Stateflow) version

- Breach

## Installation of [Breach](https://github.com/decyphir/breach)

 1. start matlab, set up a C/C++ compiler using the command `mex -setup`. (Refer to [here](https://www.mathworks.com/help/matlab/matlab_external/changing-default-compiler.html) for more details.)
  
 2. navigate to home in Matlab commandline, and run `InstallBreach`
  > Note that we customized `InstallBreach`. It only compiles the online monitoring component. For the full functionality of Breach, please refer to [the original repository](https://github.com/decyphir/breach)

## Instructions on reproduction of experiment results
 
 The online monitoring feature is in the folder `Online/`. Scripts for AFC are in `Online/examples/AFC_online/plot_examples.m`; scripts for AT are in `Online/examples/Autotrans_online/init_monitor`
 
### Configuration of different monitors

- the variable `d`:
  - `d = 0`: monitor only (the classic monitor ClaM)
  - `d = 1`: monitor with online diagnostics
  - `d = 2`: monitor with reset (ResM)
  - `d = 3`: Boolean causation monitor (BCauM)
  - `d = 4`: quantitative causation monitor (QCauM)

### Input data

Select one input signal by uncommenting out one line, and commenting out the other lines.

## Experimental Results

### Automatic Transmission
![Online/experiment/effect\_AT](https://anonymous.4open.science/r/STLCausationMonitor/Online/experiment/effect_AFC.png)

### Abstract Fuel Control
![Online/experiment/effect\_AFC](https://anonymous.4open.science/r/STLCausationMonitor/Online/experiment/effect_AT.png)
