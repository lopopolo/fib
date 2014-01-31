#!/usr/bin/env python3
# vim: set ft=python:

import sys

def fib(n):
    def fib2(n):
        if n < 2:
            if n % 2 == 0:
                return (1, 1)
            else:
                return (1, 2)
        else:
            a, b = fib2(n // 2 - 1)
            c = a + b
            if n % 2 == 0:
                return (a ** 2 + b ** 2, c ** 2 - a ** 2)
            else:
                return (c ** 2 - a ** 2, b ** 2 + c ** 2)

    return fib2(n)[0]


if __name__ == "__main__":
    n = 40
    if len(sys.argv) > 1:
        n = int(sys.argv[1])
    print(fib(n))

