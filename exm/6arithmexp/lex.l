%{
#include <stdlib.h>
#include "y.tab.h"
%}
%%
[0-9]+ { yylval = atoi(yytext); return NUMBER; }
[a-zA-Z]+ { yylval = atoi(yytext); return ID; }
[ \t\n]+ ;
. { return yytext[0]; }
%%
int yywrap() {
return 1;
}