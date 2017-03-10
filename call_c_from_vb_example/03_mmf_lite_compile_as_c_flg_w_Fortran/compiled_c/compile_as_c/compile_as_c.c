

#include<stdio.h>
#include<conio.h>

//__declspec(dllexport) int add(int a, int b);
extern int basin_(int, int, int, int);

int main(int a, int b)
{
	int Aa = a;
	int Bb = b;
	int Ssum;
	int return_val;

	Ssum = 0;

	// return Aa + Bb;

	return_val = basin(Aa, Bb, Ssum);
}


