program readev
 implicit none
 character(len=120) :: filename
 integer :: lu,i,ierr
 real :: t,dum(6),angmtot,delta,angmprev
 
 filename = ''
 call get_command_argument(1,filename)
 
 open(newunit=lu,file=trim(filename),status='old',iostat=ierr)
 if (ierr /= 0) stop 'usage: readev file.ev'

 read(lu,*,iostat=ierr) ! skip header
 i = 0
 do while (ierr == 0)
    read(lu,*,iostat=ierr) t,dum,angmtot
    i = i + 1
    if (i > 1 .and. ierr==0) then
       delta = (angmtot - angmprev)/abs(angmprev)
       print*,t,delta
    endif
    angmprev = angmtot
 enddo
 close(lu)

end program readev
