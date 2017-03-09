#include<stdio.h>
#include<conio.h>

__declspec(dllexport) int add(int a, int b);

int add(int a, int b)
{
	int Aa = a;
	int Bb = b;

	return Aa + Bb;
}


