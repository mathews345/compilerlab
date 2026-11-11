%{
#include <stdio.h>
int valid = 1;
void yyerror(const char *s);
int yylex(void);
%}
%token digit letter
%%
start:
letter s
;
s:
letter s
| digit s
|
;
%%
void yyerror(const char *s) {
valid = 0;
}
int main() {
printf("\nEnter a name to test for an identifier: ");
yyparse();
if (valid) {
printf("\nIt is a valid identifier!\n");
} else {
printf("\nIt is not a valid identifier!\n");
}
return 0;
}