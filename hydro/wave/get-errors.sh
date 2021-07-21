#!/bin/bash
res="16 22 32 45 64 90 128 181 256" # 181 256";
for x in $res; do
errL1=`ssplash $x/wave_00005 -y 7 -x 1 -dev /null | grep L2 | cut -d'=' -f 2 | cut -d'L' -f 1`
echo $x $errL1;
done
