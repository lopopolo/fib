#include <stdlib.h>
#include <stdio.h>

unsigned long long fib(unsigned long long n);

unsigned long long fib(unsigned long long n)
{
  unsigned long long a = 1;
  unsigned long long b = 1;
  unsigned long long temp = 0;
  for (unsigned long long i = 0ull; i < n; ++i) {
    temp = b;
    b = a + b;
    a = temp;
  }
  return a;
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
