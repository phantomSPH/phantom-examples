#!/bin/bash
~/phantom/scripts/writemake.sh shock > Makefile
make setup
make
./phantomsetup sod
./phantom sod
ssplash sod_00020 -y 17 -dev sod.eps
./phantomsetup sodcd
./phantom sodcd
ssplash sodcd_00020 -y 17 -dev sodcd.eps -p sodcd
