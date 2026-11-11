/* yacc.y */
%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(char *s);
int yylex(void);
%}
%token NUMBER ID
%left '+' '-'
%left '*' '/'
%%
E : T {
printf("Result = %d\n", $1);
return 0;
}
;
T : T '+' T { $$ = $1 + $3; }
| T '-' T { $$ = $1 - $3; }
| T '*' T { $$ = $1 * $3; }
| T '/' T { $$ = $1 / $3; }
| '-' NUMBER { $$ = -$2; }
| '-' ID { $$ = -$2; }
| '(' T ')' { $$ = $2; }
| NUMBER { $$ = $1; }
| ID { $$ = $1; }
;
%%
int main() {
printf("(After completion, press 'Ctrl' and 'D')\nEnter the expression:\n");
yyparse();
return 0;
}
void yyerror(char *s) {
printf("\nExpression is invalid: %s\n", s);
}
