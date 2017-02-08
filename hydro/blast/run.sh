#!/bin/bash
~/phantom/scripts/writemake.sh shock > Makefile
make setup
make
./phantomsetup blast
./phantom blast
ssplash blast_00020 -y 16 -dev blast.eps
