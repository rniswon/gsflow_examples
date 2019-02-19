using System;
using System.Runtime.InteropServices;

public static class Program
{
    public static int Nsegshold;
    public static double[] Diversions = new double[1];
    public static int Process_mode;
    //public static int Process_mode;
    //public static bool afr;


    //Fortran DLL interface
    [DllImport("passStr_Fortran_C.dll", CallingConvention = CallingConvention.Cdecl)]  //  CharSet = CharSet.Ansi, 
    public static extern void TEST_Var(ref int Process_mode, ref int Nsegshold, [In, Out] double[] Diversions);

    public static void Main(string[] args)
    {
        int len_fname, len_sname, i;
        string fname;
        string sname;

        fname = new String(' ', 80);
        sname = new String(' ', 80);
        len_fname = fname.Length;
        len_sname = sname.Length;

        // Convert string to Fortran array of characters.
        char[] inputPathChars_f = fname.ToCharacterArrayFortran(len_fname);
        char[] inputPathChars_s = sname.ToCharacterArrayFortran(len_sname);

        //Console.WriteLine(fname);

        //TEST_Var(ref len_fname, inputPathChars_f, ref len_sname, inputPathChars_s);
        Process_mode = 1;
        Nsegshold = 1;
        TEST_Var(ref Process_mode, ref Nsegshold, Diversions);

        // Redimension arrays to size determined in fortran
        Diversions = (double[])ResizeArray(Diversions, new int[] { Nsegshold });

        Process_mode = 2;
        TEST_Var(ref Process_mode, ref Nsegshold, Diversions);


        string xy_FileName = new string(inputPathChars_f);
        string map_FileName = new string(inputPathChars_s);

        xy_FileName = xy_FileName.Trim();
        map_FileName = map_FileName.Trim();

        Console.WriteLine("From C#: The name of the MODSIM input file is: " + xy_FileName);
    }

    private static Array ResizeArray(Array arr, int[] newSizes)
    {
        if (newSizes.Length != arr.Rank)
            throw new ArgumentException("arr must have the same number of dimensions " +
                                        "as there are elements in newSizes", "newSizes");

        var temp = Array.CreateInstance(arr.GetType().GetElementType(), newSizes);
        int length = arr.Length <= temp.Length ? arr.Length : temp.Length;
        Array.ConstrainedCopy(arr, 0, temp, 0, length);
        return temp;
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


