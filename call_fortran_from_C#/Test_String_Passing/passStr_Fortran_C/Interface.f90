!
    MODULE passStr_Fortran_C
!
    CONTAINS
!
    SUBROUTINE TEST_Var(File_length, XY_NAME, Sile_length, MAP_NAME) BIND(C,NAME="TEST_Var")
!      
    !DEC$ ATTRIBUTES DLLEXPORT :: TEST_Var
!
    INTEGER,          INTENT(in)    :: File_length, Sile_length
    CHARACTER(LEN=1), INTENT(inout) :: XY_NAME(File_length), MAP_NAME(Sile_length)
!
    INTEGER                                :: L1, L2
    CHARACTER*80                           :: Str, XYFileName, MapFileName
!
    XYFileName = 'SomeLong_MODSIM_Input_File_Name.xy'
    MapFileName = 'An_Example_SFR_MODSIM_Mapping_File_name.txt'
    
    WRITE(*,*) "From Fortran (1): The name of the MODSIM input file is: ", XYFileName
    L1 = LEN(Trim(XYFileName))
    L2 = LEN(Trim(MapFileName))
!
    DO i = 1, File_length
        IF ( i <= L1 ) THEN
          XY_NAME(i) = XYFileName(i:i)
        ELSE
          XY_NAME(i) = ' '
        ENDIF
!
        IF ( i <= L2 ) THEN
          MAP_NAME(i) = MapFileName(i:i)
        ELSE
          MAP_NAME(i) = ' '
        ENDIF
    ENDDO
!
    WRITE(*,*) "From Fortran (2): The name of the MODSIM input file is: ", XY_NAME
!
    END SUBROUTINE TEST_Var
!
    END MODULE passStr_Fortran_C