make SETUP=dustywave DUSTFRAC=yes setup
make SETUP=dustywave DUSTFRAC=yes
reslist='64' # 32 64' #128 256'
for res in $reslist; do
   prevdir=$PWD;
   dir=onef/$res;
   if [ ! -d $dir ]; then
      mkdir $dir;
   fi
   echo $dir;
   cd $dir;
   cp $prevdir/all.in ./wave.in
   cp $prevdir/phantom .
   ./phantom wave.in
   ~/phantom/scripts/stageruns.sh wave_*.in
   for x in wave_K*; do
      echo $x;
      cd $x;
      $prevdir/phantomsetup $x.in << EOF
$res
1.0
1.0
1.e-4
1.0
1.0
EOF
      ./phantom $x.in >& $x.log;
      ln -s $x.in wave.in;
      cd ..;
   done
   cd $prevdir;
done
