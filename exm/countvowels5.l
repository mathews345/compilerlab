%{
#include <stdio.h>
#include <string.h>
int vow_count = 0;
int const_count = 0;
%}
%%
[aeiouAEIOU]+ { vow_count++; }
[a-zA-Z] { const_count++; }
\n {
printf("Number of vowels: %d\n", vow_count);
printf("Number of consonants: %d\n", const_count);
vow_count = 0;
const_count = 0;
}
%%
int yywrap(void) {
return 1;
}
int main() {
printf("Enter the strings of vowels and consonants:\n");
yylex();
return 0;
}