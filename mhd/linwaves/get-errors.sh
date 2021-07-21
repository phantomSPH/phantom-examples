num="00010";
for x in wave??_${num} wave128_${num}; do
errs=`ssplash $x -y 8 -x 1 -dev /null | grep L1 | perl -ne 'my ($l1,$l2,$linf) = $_ =~/=\s(.*)L2.*=\s(.*)L.*=\s(.*)/g; print "$l1 $l2 $linf\n"'`
y=${x/wave/}
z=${y/_${num}/}
echo $z $errs;
done
