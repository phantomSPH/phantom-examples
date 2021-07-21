program cutpix
 use pixfiles, only:read_pixfile
 implicit none
 integer :: nx,ny,i,ierr,j1,j2
 real, dimension(:,:), allocatable :: datpix
 real :: dx
 character(len=120) :: filename

 if (command_argument_count() < 1) stop 'Usage: cutpix file.pix'
 call get_command_argument(1,filename)
 call read_pixfile(filename,nx,ny,datpix,ierr)
 if (ierr /= 0) stop 'ERROR reading pixmap'
 dx = 1./nx
 j1 = nint(0.4277*ny)
 j2 = nint(0.3125*ny)
 print*,' writing to slice.out with j1,j2=',j1,j2
 open(unit=1,file='slice.out',status='replace')
 do i=1,nx
    write(1,*) (i-0.5)*dx,datpix(i,j1),datpix(i,j2)
 enddo
 close(1)

end program cutpix
