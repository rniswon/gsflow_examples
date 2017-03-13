Imports System.Collections
Imports System
Imports System.Runtime.InteropServices
Imports System.IO
Imports System.Data

Module Module1

    <DllImport("example_fortran_directory.dll", CallingConvention:=CallingConvention.Cdecl)>
    Public Sub MFNWT_RUN(ByRef a As Integer, ByRef b As Integer, ByRef c As Integer)  'ref bool AdvFlwRdr
    End Sub

    ' Private Declare Sub MFNWT_RUN Lib "example_fortran_directory.dll" Alias "MFNWT_RUN" (<[In](), Out()> ByRef A As Integer, ByRef B As Integer, ByRef C As Integer)
    'Private Declare Sub MFNWT_RUN Lib "example_fortran_directory.dll" Alias "MFNWT_RUN" (<[In](), Out()> ByRef A As Integer, ByRef B As Integer, ByRef C As Integer)

    Sub Main()
        Dim first As Integer
        Dim second As Integer

        Dim answer As Integer

        first = 6
        second = 7
        answer = 0
        MFNWT_RUN(first, second, answer)

        MsgBox(answer)

    End Sub

End Module
