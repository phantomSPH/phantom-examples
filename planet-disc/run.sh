#!/bin/bash
./phantomsetup disc
./phantom disc.in
ssplash disc_00100 -r 13 -x 1 -y 2 -dev planetdisc.eps
