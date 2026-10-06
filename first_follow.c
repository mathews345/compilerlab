#include <stdio.h>
#include <string.h>
#include <ctype.h>

#define MAX 10

char prod[MAX][20];   // Productions
char first[MAX][20], follow[MAX][20];
int n;

void findFirst(char *res, char c);
void findFollow(char *res, char c);

int isNonTerminal(char c) {
    return isupper(c);
}

void addToSet(char *set, char c) {
    if (!strchr(set, c)) {
        int len = strlen(set);
        set[len] = c;
        set[len + 1] = '\0';
    }
}

void findFirst(char *res, char c) {
    if (!isNonTerminal(c)) {
        addToSet(res, c);
        return;
    }

    for (int i = 0; i < n; i++) {
        if (prod[i][0] == c) {
            int j = 3;   // skip A->

            while (prod[i][j]) {
                if (prod[i][j] == c)
                    break;   // avoid left recursion

                char temp[20] = "";

                findFirst(temp, prod[i][j]);

                for (int k = 0; temp[k]; k++) {
                    if (temp[k] != '#')
                        addToSet(res, temp[k]);
                }

                if (!strchr(temp, '#'))
                    break;

                j++;

                if (!prod[i][j])
                    addToSet(res, '#');
            }
        }
    }
}

void findFollow(char *res, char c) {
    if (c == prod[0][0])   // Start symbol
        addToSet(res, '$');

    for (int i = 0; i < n; i++) {
        for (int j = 3; prod[i][j]; j++) {
            if (prod[i][j] == c) {

                if (prod[i][j + 1]) {
                    char temp[20] = "";

                    findFirst(temp, prod[i][j + 1]);

                    for (int k = 0; temp[k]; k++) {
                        if (temp[k] != '#')
                            addToSet(res, temp[k]);
                    }

                    if (strchr(temp, '#'))
                        findFollow(res, prod[i][0]);

                } else if (prod[i][0] != c) {
                    findFollow(res, prod[i][0]);
                }
            }
        }
    }
}

int main() {
    printf("Enter number of productions: ");
    scanf("%d", &n);

    printf("Enter productions (e.g., A->aB or A->a|b):\n");

    for (int i = 0; i < n; i++) {
        scanf("%s", prod[i]);
    }

    for (int i = 0; i < n; i++) {
        char nt = prod[i][0];

        if (!strlen(first[nt - 'A']))
            findFirst(first[nt - 'A'], nt);

        if (!strlen(follow[nt - 'A']))
            findFollow(follow[nt - 'A'], nt);
    }

    printf("\nFirst and Follow sets:\n");

    for (int i = 0; i < n; i++) {
        char nt = prod[i][0];

        printf("FIRST(%c): { ", nt);

        for (int j = 0; first[nt - 'A'][j]; j++)
            printf("%c ", first[nt - 'A'][j]);

        printf("} ");

        printf("FOLLOW(%c): { ", nt);

        for (int j = 0; follow[nt - 'A'][j]; j++)
            printf("%c ", follow[nt - 'A'][j]);

        printf("}\n");
    }

    return 0;
}