#include <stdlib.h>
#include <stdio.h>
#include <map>

using namespace std;

static map<unsigned long long int, unsigned long long int> cache;

unsigned long long int fib(unsigned long long int n);

unsigned long long int fib(unsigned long long int n)
{
  unsigned long long int r = 0;
  auto iterator = cache.find(n);
  if (iterator != cache.end()) {
    r = iterator->second;
  } else {
    if (n < 2) {
      r = 1;
    } else {
      r = fib(n - 1) + fib(n - 2);
    }
    cache[n] = r;
  }
  return r;
}

int main(int argc, char **argv)
{
  unsigned long long int n = 40;
  if (argc > 1) {
    n = strtoull(argv[1], NULL, 10);
  }
  printf("%llu\n", fib(n));

  return 0;
}
