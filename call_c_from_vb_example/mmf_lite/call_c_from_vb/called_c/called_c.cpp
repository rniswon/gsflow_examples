// called_c.cpp : Defines the exported functions for the DLL application.
//

#include "stdafx.h"
#include "called_c.h"
#include <string>

using namespace std;
// using namespace System;

extern "C" __declspec(dllexport)  // This is the main difference between "Compile as C code" and "Default"
            int add(int a, int b);

int add(int a, int b)
{
	int Aa = a;
	int Bb = b;

	return Aa + Bb;
}



