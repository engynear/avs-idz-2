#include <stdio.h>
#include <string.h>

int main() {
    char str[1000];
    int i, if_count = 0, do_count = 0, int_count = 0, for_count = 0, else_count = 0;
    fgets(str, 1000, stdin);
    for (i = 0; i < strlen(str); i++) {
        if (str[i] == 'i' && str[i + 1] == 'f') {
            if_count++;
        }
        if (str[i] == 'd' && str[i + 1] == 'o') {
            do_count++;
        }
        if (str[i] == 'i' && str[i + 1] == 'n' && str[i + 2] == 't') {
            int_count++;
        }
        if (str[i] == 'f' && str[i + 1] == 'o' && str[i + 2] == 'r') {
            for_count++;
        }
        if (str[i] == 'e' && str[i + 1] == 'l' && str[i + 2] == 's' && str[i + 3] == 'e') {
            else_count++;
        }
    }
    printf("if: %d, do: %d, count: %d, for: %d, else: %d", if_count, do_count, int_count, for_count,
           else_count);
}
