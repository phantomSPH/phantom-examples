echo "vs next highest"
./get-conv kh_00020_logdensity_slice.pix kh128_00020_logdensity_slice.pix
./get-conv kh128_00020_logdensity_slice.pix kh256_00020_logdensity_slice.pix 
./get-conv kh256_00020_logdensity_slice.pix 512/kh_00020_logdensity_slice.pix
echo "vs 256"
./get-conv kh_00020_logdensity_slice.pix kh256_00020_logdensity_slice.pix
./get-conv kh128_00020_logdensity_slice.pix kh256_00020_logdensity_slice.pix 
echo "vs 512"
./get-conv kh_00020_logdensity_slice.pix 512/kh_00020_logdensity_slice.pix
./get-conv kh128_00020_logdensity_slice.pix 512/kh_00020_logdensity_slice.pix
./get-conv kh256_00020_logdensity_slice.pix 512/kh_00020_logdensity_slice.pix
