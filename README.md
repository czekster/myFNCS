# myFNCS

This will install and run everything needed for FNCS (`FNCS`, `GridLab-D`, `ns-3.26`, `zeromq`, `libczmq-dev` (in Ubuntu), `xterm`, `autoconf`, `libxerces`, `libtool`, and other auxiliary tools -- more info on the attached script).

It starts the FNCS tutorial (https://github.com/FNCS/FNCS-Tutorial/tree/master/demo-gld-ns3) if everything went all right.

After running the tutorial, you should see two xterm screens generating output (without errors) and another xterm with the FNCS (which is the middleware for GridLab-D plus ns-3) -- *in total there are three xterm windows*.

# How to use it?

It has worked on [Oracle VirtualBox](https://www.virtualbox.org/wiki/Downloads) `6.0.8` running [KUbuntu 19.04](https://kubuntu.org/getkubuntu/) (kernel `5.0.0-29-generic`).

1. Download VirtualBox
2. Download an iso for the KUbuntu
3. Install KUbuntu (standard installation or your preferred 'flavor')
--------
5. change script to execution mode: `chmod a+x install-fncs.sh`
6. run `./install-fncs.sh`

The models are located under the `$HOME/myFNCS/FNCS-Tutorial/demo-gld-ns3/` folder

The ns-3 model file is named `firstN.cc`

**The GridLab-D model file is named `F1_250_house.glm`** (all information as to the Test Feeder, power supply, households, appliances for each one of the 250 houses) as well as their scheduling is in this file. This is the energy part where GridLab-D will run. **The network part is in the `firstN.cc` file (with ns-3 commands)**. It maps each household to an IP address.

Output files are usually .csv files (several, depending on model parameters) generated during the simulation, after executing the `./run.sh` script.

# How long it will take for everything to compile?
Depends. On a shared two-core _virtual machine_ (VirtualBox) running KUbuntu with (shared) 16Gb of RAM took 20 min (+-2) for all.
The script compiles the following sofware:

1. download and install `libczmq`, `xterm`, `autoconf`, `libxerces` and `libtool` (relatively fast)
2. `zeromq-3.2.4` (fast)
3. `FNCS` (relatively fast)
4. `ns-3.26` (this one takes a while, so many files and libraries)
5. `GridLab-D` (medium - lots of solvers, climate modules, powerflow algorithms, etc.)

# HELICS
It is worth mentioning that they are transitioning towards another platform called [HELICS](https://www.helics.org/helics.html)
