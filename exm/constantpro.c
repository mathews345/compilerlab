#include <stdio.h>
int main()
{
int x, y, z;
x = 10;
y = x + 45;
z = y * 4;
printf("The value of z = %d", z);
return 0;
}

// cc -c -S program.c
// cc -c -S -O2 program.c
//no -c