%{
#include <stdio.h>
int lc = 0, sc = 0, tc = 0, ch = 0;
%}
%%
\n { lc++; }
[ ]+ { sc++; }
\t { tc++; }
. { ch++; }
%%
int main() {
printf("Enter string:\n(After completion, press 'Ctrl' and 'D')\n");
yylex();
printf("\nNo. of lines: %d", lc);
printf("\nNo. of spaces: %d", sc);
printf("\nNo. of tabs: %d", tc);
printf("\nNo. of other characters: %d\n", ch);
return 0;
}
// hii there