#include <stdio.h>

int MAX_STRING_LEN = 1000;

int main (int argc, char *argv) {
  char s[MAX_STRING_LEN];

  fgets(s, MAX_STRING_LEN, stdin);

  int i = 0;
  for (int i = 0; i < MAX_STRING_LEN; i++) {
    if(s[i] == 'T') {
      s[i] = 'U';
    } else if (s[i] == '\n') {
      s[i] = '\0';
      break;
    }
  } 

  puts(s);
}
