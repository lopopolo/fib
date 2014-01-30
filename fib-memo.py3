#!/usr/bin/env python3
# vim: set ft=python:

import functools
import sys


@functools.lru_cache(maxsize=None)
def fib(n):
    return 1 if n < 2 else fib(n - 1) + fib(n - 2)


if __name__ == "__main__":
    n = 40
    if len(sys.argv) > 1:
        n = int(sys.argv[1])
    print(fib(n))

