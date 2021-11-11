#include <stdio.h>

typedef struct BaseCounts {
  int a;
  int c;
  int g;
  int t;
} BaseCounts;

int MAX_STRING_LEN = 1000;

int main (int argc, char *argv) {
  char s[MAX_STRING_LEN];
  BaseCounts counts = {0, 0, 0, 0};

  fgets(s, MAX_STRING_LEN, stdin);

  int i = 0;
  do {
    switch(s[i]) {
      case 'A':
        counts.a += 1;
        break;
      case 'C':
        counts.c += 1;
        break;
      case 'G':
        counts.g += 1;
        break;
      case 'T':
        counts.t += 1;
        break;
      default:
        break;
    }
    i++;
  } while (s[i] != '\n');

  printf("%d %d %d %d\n", counts.a, counts.c, counts.g, counts.t);
}
