#include <stdlib.h>
#include <stdio.h>

unsigned long long fib(unsigned long long n);

unsigned long long fib(unsigned long long n)
{
  if (n < 2) {
    return 1;
  } else {
    return fib(n - 1) + fib(n - 2);
  }
}

int main(int argc, char **argv)
{
  unsigned long long n = 40;
  if (argc > 1) {
    n = strtoull(argv[1], NULL, 10);
  }
  printf("%llu\n", fib(n));

  return 0;
}
