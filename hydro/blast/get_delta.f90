program get_delta_from_ev
 implicit none
 character(len=120) :: filename
 integer :: lu,i,ierr
 integer, parameter :: maxev = 17
 real :: t,dat(maxev),datprev(maxev),dat0(maxev),delta(maxev)
 
 filename = ''
 call get_command_argument(1,filename)
 
 open(newunit=lu,file=trim(filename),status='old',iostat=ierr)
 if (ierr /= 0) stop 'usage: get_delta file.ev'

 read(lu,*,iostat=ierr) ! skip header
 i = 0
 dat0 = 1.
 do while (ierr == 0)
    read(lu,*,iostat=ierr) t,dat
    i = i + 1
    if (i > 1 .and. ierr==0) then
       where (abs(dat0) > 0.)
          delta(:) = (dat - datprev)/abs(dat0)
       elsewhere
          delta(:) = (dat - datprev)    
       end where
       print*,t,delta
    elseif (i==1) then
       dat0 = dat
    endif
    datprev = dat
 enddo
 close(lu)

end program get_delta_from_ev
