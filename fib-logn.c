#include <inttypes.h>
#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>

typedef struct {
	uint64_t a;
	uint64_t b;
} f2;

uint64_t fib(uint64_t n);
f2 fib2(uint64_t n);

uint64_t fib(uint64_t n)
{
	return fib2(n).a;
}

f2 fib2(uint64_t n)
{
	if (n < UINT64_C(2)) {
		f2 r0 = {UINT64_C(1), UINT64_C(1)};
		f2 r1 = {UINT64_C(1), UINT64_C(2)};
		if (n % UINT64_C(2) == 0) {
			return r0;
		} else {
			return r1;
		}
	} else {
		f2 next = fib2(n / UINT64_C(2) - UINT64_C(1));
		uint64_t c = next.a + next.b;
		if (n % UINT64_C(2) == UINT64_C(0)) {
			f2 r = {next.a * next.a + next.b * next.b, c * c - next.a * next.a};
			return r;
		} else {
			f2 r = {c * c - next.a * next.a, next.b * next.b + c * c};
			return r;
		}
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
