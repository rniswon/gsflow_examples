
    SUBROUTINE MFNWT_RUN(KSTP,KPER,SUMMATION) !bind(C,NAME="MFNWT_RUN")
!   
        !DEC$ ATTRIBUTES DLLEXPORT, ALIAS: 'MFNWT_RUN' :: MFNWT_RUN
        !DEC$ ATTRIBUTES REFERENCE :: KSTP
        !DEC$ ATTRIBUTES REFERENCE :: KPER
        !DEC$ ATTRIBUTES REFERENCE :: SUMMATION
!
        IMPLICIT NONE
! ...argument declarations
        INTEGER :: KPER, KSTP
        INTEGER :: SUMMATION
    
        ! *** Note to self: Don't forget about the compiler setting that appends underscore ***
        
        INTEGER kkper, kkstp
        INTEGER add_em_up
        
        kkper = KPER
        kkstp = KSTP
        
        add_em_up = kkper + kkstp
        
        SUMMATION = add_em_up 
    
    END SUBROUTINE MFNWT_RUN