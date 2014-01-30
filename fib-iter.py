#!/usr/bin/env python3
# vim: set ft=python:

import sys

def fib(n):
    a, b = 1, 1
    for i in range(0, n):
        a, b = b, a + b
    return a


if __name__ == "__main__":
    n = 40
    if len(sys.argv) > 1:
        n = int(sys.argv[1])
    print(fib(n))

