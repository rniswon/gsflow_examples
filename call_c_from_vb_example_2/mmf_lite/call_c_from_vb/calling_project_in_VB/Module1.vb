Imports System.Runtime.InteropServices
Imports System

Module Module1

    'Public Class called_c

    <DllImport("D:\EDM_LT\GitHub\gsflow.git\gsflow_examples.git\call_c_from_vb_example\mmf_lite\call_c_from_vb\Debug\called_c.dll", EntryPoint:="add", ExactSpelling:=False, CallingConvention:=CallingConvention.Cdecl)>
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
