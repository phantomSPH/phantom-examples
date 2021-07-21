#!/bin/bash
~/phantom/scripts/writemake.sh mhdshock > Makefile
make setup MAXP=2000000
make MAXP=2000000
./phantomsetup briowu
./phantom briowu
ssplash briowu_00010 -y 25 -dev briowu.eps
