program crap
 integer :: n,i,ires(7),res(7)
 real :: x,nx,dx
 
 n = 9
! print*,' enter n'
! read*,n
 
 dx = (log10(256.) - log10(16.))/(n-1)
 
 do i=1,n
    print "(f16.2)",16.*10**((i-1)*dx)
    res(i) = nint(16.*10**((i-1)*dx))
    print*,res(i)
 enddo
 
 ires = (/16*10*9,22*12*12,32*18*18,45*26*27,64*36*39,90*52*54,128*74*78/)

 do i=1,size(ires)
    print*,real(4.*ires(i))**(1./3.)
 enddo

end program crap
