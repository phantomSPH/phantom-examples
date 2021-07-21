#!/bin/bash
~/phantom/scripts/writemake.sh mhdshock > Makefile
make setup
make
./phantomsetup mshk3
./phantom mshk3
ssplash mshk3_00010 -y 25 -dev mshk3.eps
