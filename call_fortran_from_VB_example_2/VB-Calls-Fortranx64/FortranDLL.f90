! FortranDLL
! Description: This sample demonstrates a mixed VB-Fortran
!              x64 application.  The purpose is to demonstrate
!              the VB declarations necessary to pass an array
!              from VB to IVF.
!              This is a Fortran subroutine contained in a 
!              DLL Project type and produces a DLL to be called
!              from Visual Basic.
! Input files:
!  NONE
! Output files:
!  NONE
! History:  v1.0

Subroutine FortranDLL( Array1, upbound )

!DEC$ ATTRIBUTES DLLEXPORT, ALIAS: 'FORTRANDLL' :: FortranDLL
!DEC$ ATTRIBUTES REFERENCE :: Array1
!DEC$ ATTRIBUTES REFERENCE :: upbound
    Implicit None
! ...argument declarations
    Integer(4) :: upbound
	Integer(4) :: Array1(1:upbound)
	
! Local variables
    Integer(4) :: I
	write(*,'(A,I)') "Array upper bound passed in ", upbound
	write(*,*) "Array elements passed in: "
	do i=1,upbound
	  write(*,'("element:", I2, 2X, I8)' ) i, Array1(i)
    end do

    write(*,*) "Adding 10 to each element and passing back to VB"
    Array1 = Array1 + 10
    
End Subroutine FortranDLL