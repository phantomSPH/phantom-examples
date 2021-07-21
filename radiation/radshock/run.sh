#!/bin/bash
~/phantom/scripts/writemake.sh radshock > Makefile
make setup
make
./phantomsetup sod
./phantom sod
ssplash sod_00020 -y 17 -dev sod.eps
