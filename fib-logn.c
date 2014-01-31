#include <stdlib.h>
#include <stdio.h>

typedef struct {
	unsigned long long a;
	unsigned long long b;
} f2;

unsigned long long fib(unsigned long long n);
f2 fib2(unsigned long long n);

unsigned long long fib(unsigned long long n)
{
	return fib2(n).a;
}

f2 fib2(unsigned long long n)
{
	if (n < 2) {
		f2 r0 = {1, 1};
		f2 r1 = {1, 2};
		if (n % 2 == 0) {
			return r0;
		} else {
			return r1;
		}
	} else {
		f2 next = fib2(n / 2 - 1);
		unsigned long long c = next.a + next.b;
		if (n % 2 == 0) {
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
  unsigned long long n = 40;
  if (argc > 1) {
    n = strtoull(argv[1], NULL, 10);
  }
  printf("%llu\n", fib(n));

  return 0;
}
