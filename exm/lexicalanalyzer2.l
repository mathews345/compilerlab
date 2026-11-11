%{
#include <stdio.h>
%}
delim [\t]
ws {delim}+
letter [A-Za-z]
digit [0-9]
id {letter}({letter}|{digit})*
num {digit}+(\.{digit}+)?(E[+|-]?{digit}+)?
%%
{ws} { printf("no action"); }
if|else|then { printf("%s is a keyword\n", yytext); }
{id} { printf("%s is an identifier\n", yytext); }
{num} { printf("it is a number\n"); }
"<" { printf("it is a relational operator less than\n");
}
"<=" { printf("it is a relational operator less than or equal\n"); }
">" { printf("it is a relational operator greater than\n"); }
">=" { printf("it is a relational operator greater than or equal\n"); }
"==" { printf("it is a relational operator equal\n"); }
"<>" { printf("it is a relational operator not equal\n");
}
%%
int yywrap(void)
{
return 1;
}

int main(void)
{
printf("Enter String/Keywords/Relational Operators:\n");
yylex();
return 0;
}

// if count < 10