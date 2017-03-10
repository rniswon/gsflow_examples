
    INTEGER FUNCTION basin(KSTP,KPER,SUMMATION) !bind(C,NAME="basin")
    

        INTEGER, INTENT(in) :: KPER, KSTP
        INTEGER, INTENT(out):: SUMMATION
    
        ! *** Note to self: Don't forget about the compiler setting that appends underscore ***
        
        INTEGER kkper, kkstp
        INTEGER add_em_up
        
        kkper = KPER
        kkstp = KSTP
        
        add_em_up = kkper + kkstp
        
        SUMMATION = add_em_up
        
        basin = 0
        RETURN 
    
    END FUNCTION basin