#include <stdlib.h>
#include <stdio.h>

unsigned long fib(unsigned long n)
{
  if (n < 2) {
    return 1;
  } else {
    return fib(n - 1) + fib(n - 2);
  }
}

int main(int argc, char **argv)
{
  unsigned long n = 40;
  if (argc > 1) {
    n = atoi(argv[1]);
  }
  printf("%lu\n", fib(n));

  return 0;
}
