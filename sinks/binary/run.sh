#!/bin/bash
~/phantom/scripts/writemake.sh binary > Makefile
make setup
make
list='0.0 0.3 0.5 0.7 0.9';
for ecc in $list; do
cp binary.setup binary.setup.bak
sed 's/ecc =       0.9/ecc = 0.7/' binary.setup.bak > binary.setup
./phantomsetup binary
./phantom binary.in
cp binary01.ev ecc$ecc.ev
cp binary.setup.bak binary.setup
done
splash -e ecc?.?ev -y 6 -x 1 -dev /eps

