#!/bin/bash

# 05-August-2020
# Author: Ricardo M. Czekster

# this script will install and run FNCS
# then, it will execute the FNCS-tutorial provided in https://github.com/FNCS/FNCS-Tutorial/tree/master/demo-gld-ns3

sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get -y install xterm make g++ git libczmq-dev libsodium-dev pkg-config

#create temp folder for packages
mkdir $HOME/myFNCS
cd $HOME/myFNCS
wget http://download.zeromq.org/zeromq-4.1.4.tar.gz
tar xfz zeromq-4.1.4.tar.gz
cd zeromq-4.1.4
./configure --prefix=$HOME/FNCS_install
make
sudo make install

cd $HOME/myFNCS

#install FNCS2
git clone https://github.com/GridOPTICS/FNCS2.git
cd FNCS2
git checkout -b develop origin/develop
git pull

./configure --prefix=$HOME/FNCS_install --with-zmq=$HOME/FNCS_install
make
sudo make install

cd $HOME/myFNCS

#install ns3.26
git clone https://github.com/FNCS/ns-3.26
cd ns-3.26
CFLAGS="-g -O2" CXXFLAGS="-g -O2" ./waf configure --prefix=$HOME/FNCS_install --with-fncs=$HOME/FNCS_install --with-zmq=$HOME/FNCS_install --disable-python
./waf build
sudo ./waf install

cd $HOME/myFNCS

#install gridlab-d
git clone https://github.com/gridlab-d/gridlab-d

cd gridlab-d
git checkout -b develop origin/develop
git pull

#install auxiliary libraries
sudo apt-get -y install autoconf libxerces-c-dev libtool

autoreconf -fi

./configure --prefix=$HOME/FNCS_install --with-xerces=$HOME/FNCS_install --with-fncs=$HOME/FNCS_install --enable-silent-rules 'CFLAGS=-g -O0 -w' 'CXXFLAGS=-g -O0 -w' 'LDFLAGS=-g -O0 -w'
make
sudo make install

#needed exports so it finds paths and etc.
export GLPATH="$HOME/FNCS_install/bin:$HOME/FNCS_install/lib/gridlabd:$HOME/FNCS_install/share/gridlabd"
export PATH="$PATH:$HOME/FNCS_install/bin"
export LD_LIBRARY_PATH="$HOME/FNCS_install/lib:$HOME/FNCS_install/lib/gridlabd/"
export FNCS_INSTALL="$HOME/FNCS_install"
export FNCS_FATAL=yes

# Testing - running the FNCS-Tutorial example
cd $HOME/myFNCS/
git clone https://github.com/FNCS/FNCS-Tutorial

cd FNCS-Tutorial/demo-gld-ns3
./compile-ns3.sh

echo "type './run.sh' to execute the FNCS-Tutorial"




