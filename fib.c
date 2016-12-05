#include <inttypes.h>
#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>

uint64_t fib(uint64_t n);

uint64_t fib(uint64_t n)
{
  if (n < UINT64_C(2)) {
    return UINT64_C(1);
  } else {
    return fib(n - UINT64_C(1)) + fib(n - UINT64_C(2));
  }
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
