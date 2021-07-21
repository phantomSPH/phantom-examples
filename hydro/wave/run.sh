#reslist='16 22 32 45 64 90 128 181 256'
reslist='16 22 32 45 64 90 128 181 256'
#reslist='16 22 32 45 64 90'
for res in $reslist; do
    mkdir $res;
    cd $res;
    echo $res;
    cp ../wave.in .
    #cp ../phantom .
    ../phantomsetup wave.in << EOF
$res
1.0
1.0
1.e-4
EOF
    ../phantom wave.in >& wave.log;
    cd ..;
done
