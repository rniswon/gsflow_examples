! Copyright (C) 2007 Intel Corporation. All Rights Reserved. 
!
! The source code contained or described herein and all documents related to the source code 
! ("Material") are owned by Intel Corporation or its suppliers or licensors. Title to the 
! Material remains with Intel Corporation or its suppliers and licensors.  The Material is 
! protected by worldwide copyright laws and treaty provisions. No part of the Material may be 
! used, copied, reproduced, modified, published, uploaded, posted, transmitted, distributed, 
! or disclosed in any way except as expressly provided in the license provided with the 
! Materials.  No license under any patent, copyright, trade secret or other intellectual 
! property right is granted to or conferred upon you by disclosure or delivery of the 
! Materials, either expressly, by implication, inducement, estoppel or otherwise, except as 
! expressly provided in the license provided with the Materials.

! Fortran part of a VB-Fortran DLL example. This
! routine DLL_ROUT is called from a VB.NET executable
! program.
SUBROUTINE DLL_ROUT (DBL_IN, STRING_IN, DBL_OUT)
IMPLICIT NONE
! Specify that DLL_ROUT is exported to a DLL
! and that the external name is 'DLL_ROUT'
!DEC$ ATTRIBUTES DLLEXPORT, STDCALL :: DLL_ROUT
!DEC$ ATTRIBUTES ALIAS:'DLL_ROUT' :: DLL_ROUT

REAL(8), INTENT(IN) :: DBL_IN(4)
CHARACTER(10), INTENT(IN) :: STRING_IN
!DEC$ ATTRIBUTES REFERENCE :: STRING_IN
! When VB passes in a "ByVal String", it passes the address
! of a NUL-terminated string, similar to what C would do,
! and no separate length.  The REFERENCE attribute tells
! Fortran not to expect a length.  In order to use a function
! such as INDEX, we need to supply some maximum length to Fortran
! which should be at least as long as the longest expected string.
REAL(8), INTENT(OUT) :: DBL_OUT(4)

REAL(8) STRVAL
INTEGER IOS, STRLEN

STRLEN = INDEX(STRING_IN, CHAR(0)) - 1

! Convert STRING_IN to a double.  If we get an error, we'll
! supply 1.0 as a default

READ (STRING_IN(1:STRLEN), *, IOSTAT=IOS) STRVAL
IF (IOS /= 0) STRVAL = 1.0
DBL_OUT = STRVAL * DBL_IN
RETURN
END 