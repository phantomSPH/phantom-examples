#!/bin/bash
~/phantom/scripts/writemake.sh sedov > Makefile
make setup KERNEL=quintic
make KERNEL=quintic
# run 50 x 50 x 50
./phantomsetup blast50 << EOF
50
EOF
./phantom blast50
ssplash blast50_00020 -y 6 -x 1 -dev sedov50.eps
# run 100 x 100 x 100
./phantomsetup blast100 << EOB
100
EOB
./phantom blast100
ssplash blast100_00020 -y 6 -x 1 -dev sedov100.eps
