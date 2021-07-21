#!/bin/bash
files="wave16_00001 wave22_00001 wave32_00001 wave45_00001 wave64_00001 wave90_00001 wave128_00001";
ssplash $files -y 14 -x 13 -dev /null | grep L2 #| cut -d'=' -f 2 | cut -d'L' -f 1
