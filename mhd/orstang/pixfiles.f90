module pixfiles
 implicit none

contains
subroutine read_pixfile(filename,npixx,npixy,datpix,ierr)
 character(len=*), intent(in) :: filename
 integer, intent(out) :: npixx,npixy
 real,    intent(out), allocatable :: datpix(:,:)
 integer, intent(out) :: ierr
 integer :: nheader,i,j,iunit,nerr
 character(len=20) :: line
 character(len=1) :: char

open(newunit=iunit,file=filename,status='old',form='formatted',iostat=ierr)
if (ierr /=0) then
 print*,'error opening '//trim(filename)
 return
else
 npixx = 0
 npixy = 0
 nheader = 0
 do while(ierr==0)
    read(iunit,"(a)",iostat=ierr) line
    line = trim(adjustl(line))
    if (line(1:1) /= '#') ierr = 1
    if (ierr==0) nheader = nheader + 1
 enddo
 rewind(iunit)
 do i=1,nheader-1
     read(iunit,*,iostat=ierr)
 enddo
 read(iunit,*,iostat=ierr) char,npixx,npixy
 if (ierr /= 0 .or. npixx.le.0 .or. npixy.le.0) then
     print*,'ERROR reading size of pixel map, got nx = ',npixx,' ny = ',npixy,&
            ', skipped ',nheader,' header lines'
 else
     print "(a,i5,a,i5,a)",' reading',npixx,' x',npixy,' pixel map from '//trim(filename)
 endif
 allocate(datpix(npixx,npixy),stat=ierr)
 if (ierr /= 0) then
     print "(a)",' ERROR allocating memory for pixel map'
     close(iunit)
     return
 endif
 nerr = 0
 do j=1,npixy
     read(iunit,*,iostat=ierr) datpix(1:npixx,j)
     if (ierr /= 0) nerr = nerr + 1
 enddo
 if (nerr /= 0) print "(a,i3,a,i3)",' WARNING: ',nerr,' errors reading pixel map from '//trim(filename)//' on unit ',iunit

 close(iunit)
endif
end subroutine read_pixfile

end module pixfiles
