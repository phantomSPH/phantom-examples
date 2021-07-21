#!/bin/bash
~/phantom/scripts/writemake.sh binary > Makefile
make setup SETUPFILE=setup_chinchen.f90
make
./phantomsetup binary
./phantom binary.in
splash -p tracks binarySink0001N01.ev -y 3 -x 2 -dev /eps
