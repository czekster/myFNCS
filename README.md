# myFNCS

This will install and run everything needed for FNCS (FNCS, GridLab-D, ns-3.26, zeromq, libczmq-dev (ubuntu), xterm, autoconf, libxerces, libtool).

It starts the FNCS tutorial (https://github.com/FNCS/FNCS-Tutorial/tree/master/demo-gld-ns3) if everything went all right.

It uses files that were downloaded on January 27th, 2020 (I don't think the developers are maintaining FNCS nowadays).

# How to use it?
1. Unzip the first file (myFNCS.7z.001) to your $HOME directory (e.g. for john, location is /home/john/myFNCS)
2. chmod a+x install-fncs.sh
3. ./install-fncs.sh

If everything runs fine, three terminals (xterm) are open, one for FNCS, another for ns-3.26 and another one for GridLab-D.
This means that it worked.

# How long will take for everything to compile?
Depends. On a quad-core machine with 16Gb of RAM took 30 min to 45 min for all.
The script compiles the following frameworks:

0. download and install libczmq, xterm, autoconf, libxerces and libtool (relatively fast)
1. zeromq-3.2.4 (fast)
2. FNCS (relatively fast)
3. ns-3.26 (this one takes a while, so many files and libraries)
4. GridLab-D (medium - lots of solvers, climate modules, powerflow algorithms, etc.)

