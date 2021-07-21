module utils
 implicit none

contains
 subroutine read_pixmap(filename,nx,ny,dat)
  integer :: j,iu
  character(len=*), intent(in) :: filename
  integer, intent(in) :: nx,ny
  real, intent(out) :: dat(nx,ny)
  
  print*,'opening '//trim(filename)
  open(newunit=iu,file=trim(filename),status='old')
  do j=1,9
     read(iu,*) ! skip header lines
  enddo
  do j=1,nx
     read(iu,*) dat(1:nx,j)
     !if (j==nx) print*,'dat = ',dat(1:nx,j)
  enddo
  close(iu)
 
 end subroutine read_pixmap
 
 subroutine diff_pixmap(nx,ny,dat,dat2,err)
  integer, intent(in) :: nx,ny
  real,    intent(in) :: dat(nx,ny),dat2(nx,ny)
  real,    intent(out) :: err
  !integer :: i,j

  err = sum(abs(dat2 - dat)**2)/(nx*ny)
 
 end subroutine diff_pixmap
 
end module utils

program getconv
 use utils
 implicit none
 integer, parameter :: nx  = 1024,ny = 1024
 integer :: narg
 real    :: dat1(nx,ny), dat2(nx,ny), err
 character(len=120) :: file1,file2
 
 narg = command_argument_count()
 if (narg < 2) stop 'usage: getconv file1 file2'
 
 call get_command_argument(1,file1)
 call get_command_argument(2,file2)

 call read_pixmap(file1,nx,ny,dat1)
 call read_pixmap(file2,nx,ny,dat2)
 
 call diff_pixmap(nx,ny,dat1,dat2,err)
 print*,' difference is ',err

end program getconv
