!
    MODULE passStr_Fortran_C
!
    CONTAINS
!
    SUBROUTINE TEST_Var(Process_mode, Nsegshold, Diversions) BIND(C,NAME="TEST_Var")
!      
    !DEC$ ATTRIBUTES DLLEXPORT :: TEST_Var
!
    !INTEGER,          INTENT(in)    :: File_length, Sile_length
    !CHARACTER(LEN=1), INTENT(inout) :: XY_NAME(File_length), MAP_NAME(Sile_length)
    INTEGER, INTENT(IN) :: Process_mode
    INTEGER, INTENT(INOUT) :: Nsegshold
    DOUBLE PRECISION, INTENT(INOUT) :: Diversions(Nsegshold)
!
    INTEGER                                :: L1, L2, i
    CHARACTER*80                           :: Str, XYFileName, MapFileName
!
    XYFileName = 'SomeLong_MODSIM_Input_File_Name.xy'
    MapFileName = 'An_Example_SFR_MODSIM_Mapping_File_name.txt'
    
!    WRITE(*,*) "From Fortran (1): The name of the MODSIM input file is: ", XYFileName
!    L1 = LEN(Trim(XYFileName))
!    L2 = LEN(Trim(MapFileName))
!
    IF(Process_mode.eq.1) THEN
      Nsegshold = 100
    ELSE IF(Process_mode.eq.2) THEN
      DO i = 1, Nsegshold
        Diversions(i) = 3.14 * i
      ENDDO
    ENDIF
!
!    WRITE(*,*) "From Fortran (2): The name of the MODSIM input file is: ", XY_NAME
!
    END SUBROUTINE TEST_Var
!
    END MODULE passStr_Fortran_C