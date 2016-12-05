#include <inttypes.h>
#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>

uint64_t fib(uint64_t n);

uint64_t fib(uint64_t n)
{
  uint64_t a = UINT64_C(1);
  uint64_t b = UINT64_C(1);
  uint64_t temp = UINT64_C(0);
  for (uint64_t i = UINT64_C(0); i < n; ++i) {
    temp = b;
    b = a + b;
    a = temp;
  }
  return a;
}

int main(int argc, char **argv)
{
  uint64_t n = UINT64_C(40);
  if (argc > 1) {
    n = strtoull(argv[1], NULL, 10);
  }
  printf("%" PRIu64 "\n", fib(n));

  return 0;
}
