list="16 22 32 45 64 90 128"
for x in $list; do
   echo $x;
   ./phantomsetup "wave${x}" << EOF
1
$x
EOF
./phantom "wave${x}.in"
done
