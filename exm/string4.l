%{
#include <stdio.h>
#include <string.h>
int i;
%}
%%
[a-zA-Z]* {
for (i = 0; i < yyleng - 2; i++) {
if ((yytext[i] == 'a') && (yytext[i + 1] == 'b') &&
(yytext[i + 2] == 'c')) {
yytext[i] = 'A';
yytext[i + 1] = 'B';
yytext[i + 2] = 'C';
}
}
printf("%s", yytext);
}
. { ECHO; }
\n { printf("%s", yytext); }
%%
int main() {
printf("Enter any string that includes 'abc' as substring.\n");
yylex();
return 0;
}
int yywrap() {
return 1;
}
//abcdefg