Imports System.Runtime.InteropServices
Imports System

Module Module1

    'Public Class called_c

    <DllImport("C:\Users\trianae\MyLocalCode\USGS\gsflow_examples.git\call_c_from_vb_example_2\mmf_lite_compile_as_c_flg\compiled_c\Debug\CPPStaticLIBWrapper.dll", EntryPoint:="add", ExactSpelling:=False, CallingConvention:=CallingConvention.Cdecl)>
    Public Function add(ByVal a As Integer, ByVal b As Integer) As Int32
    End Function

    'End Class

    Sub Main()

        Dim val1 As Int32
        Dim val2 As Int32
        Dim answer As Int32

        val1 = 3
        val2 = 4

        answer = add(val1, val2)

        MsgBox(answer)

    End Sub

End Module
