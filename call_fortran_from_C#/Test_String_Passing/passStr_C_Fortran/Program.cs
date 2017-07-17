using System;
using System.Runtime.InteropServices;

public static class Program
{
    public static double[] Diversions = new double[100];
    public static int Process_mode;
    public static bool afr;
    

    //Fortran DLL interface
    [DllImport("passStr_Fortran_C.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.Cdecl)]
    public static extern void TEST_Var(ref int len_fname, [In, Out] char[] XYName, ref int len_sname, [In, Out] char[] MapName);

    public static void Main(string[] args)
    {
        int len_fname, len_sname;
        string fname;
        string sname;

        fname = new String(' ', 80);
        sname = new String(' ', 80);
        len_fname = fname.Length;
        len_sname = sname.Length;

        // Convert string to Fortran array of characters.
        char[] inputPathChars_f = fname.ToCharacterArrayFortran(len_fname);
        char[] inputPathChars_s = sname.ToCharacterArrayFortran(len_sname);

        Console.WriteLine(fname);

        TEST_Var(ref len_fname, inputPathChars_f, ref len_sname, inputPathChars_s);

        string xy_FileName = new string(inputPathChars_f);
        string map_FileName = new string(inputPathChars_s);

        xy_FileName = xy_FileName.Trim();
        map_FileName = map_FileName.Trim();

        Console.WriteLine("From C#: The name of the MODSIM input file is: " + xy_FileName);
    }

    public static char[] ToCharacterArrayFortran(this string source, int length)
    {
        var chars = new char[length];
        int sourceLength = source.Length;
        for (int i = 0; i < length; i++)
        {
            if (i < sourceLength)
                chars[i] = source[i];
            else
                chars[i] = ' '; // Important that these are blank for Fortran compatibility.
        }
        return chars;
    }
}


