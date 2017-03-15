Imports System.Runtime.InteropServices

Module Module1

    Private Declare Sub FortranDLL Lib "FCALL.dll" Alias "FORTRANDLL" (<[In](), Out()> ByVal Array1() As Int32, ByRef Foo As Int32)

    Sub Main()
        Dim I As Int32

        Try
            Dim Test As Int32() = {1, 2, 3, 4, 5, 6}
            FortranDLL(Test, Test.Length)
            Console.WriteLine(" ")
            Console.WriteLine("back in VB")
            Console.WriteLine("Array elements after call return:")
            For i = 0 To 5
                Console.WriteLine(Test(i))
            Next i
        Catch ex As Exception
            Console.WriteLine(ex.Message)
            My.Computer.Clipboard.SetText(ex.Message)
        Finally
            Console.ReadKey()
        End Try
    End Sub

End Module
