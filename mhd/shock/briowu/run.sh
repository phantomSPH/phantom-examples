#!/bin/bash
~/phantom/scripts/writemake.sh mhdshock > Makefile
make setup
make
./phantomsetup briowu
./phantom briowu
ssplash briowu_00010 -y 25 -dev briowu.eps
