// called_c.cpp : Defines the exported functions for the DLL application.
//

#include <string>

//using namespace std;
// using namespace System;

__declspec(dllexport)
            int add(int a, int b);

int add(int a, int b)
{
	int Aa = a;
	int Bb = b;

	return Aa + Bb;
}



