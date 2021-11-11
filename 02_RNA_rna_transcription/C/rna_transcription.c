#include <stdio.h>


int main (int argc, char *argv) {
  int ch;

   while ((ch = getchar()) != EOF) {
     if (ch == 'T') {
       putchar('U');
     } else {
       putchar(ch);
     }
   }
}
