%{
#include <stdio.h>
#include <stdlib.h>

int flag = 0;
extern int yylex(void);
extern void yyerror(const char *s);
%}

%token NUMBER
%left '+' '-' 
%left '*' '/' '%'
%left '(' ')'

%%

ArithmeticExpression:
    E {
        printf("\nResult = %d\n", $$);
        return 0;
    }
;

E:
    E '+' E { $$ = $1 + $3; }
  | E '-' E { $$ = $1 - $3; }
  | E '*' E { $$ = $1 * $3; }
  | E '/' E { $$ = $1 / $3; }
  | E '%' E { $$ = $1 % $3; }
  | '(' E ')' { $$ = $2; }
  | NUMBER { $$ = $1; }
;

%%

void yyerror(const char *s) {
    printf("\nEntered arithmetic expression is invalid: %s\n\n", s);
    flag = 1;
}

int main() {
    printf("\nEnter any arithmetic expression which can have operations: Addition, Subtraction, Multiplication, Division, Modulus, and Round brackets:\n");
    yyparse();
    if (flag == 0) {
        printf("\nEntered arithmetic expression is valid\n\n");
    }
    return 0;
}