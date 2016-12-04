# fib

Implementations of `fib` in several languages, with the goal of returning `fib(40)` the fastest possible.

This is just for fun.

## Benchmarks

Benchmark tasks exclude:

- fib.bash: I have never seen it finish `fib(40)`.
- fib.php: One iteration is over 30 seconds.
- fib.py: One iteration is over 45 seconds.
- fib.rb: One iteration is over 10 seconds
- fib-future.scala: Thrashes CPU and never finishes (possibly deadlocked).

To run the benchmarks:

```bash
make
make bench
```

| Implementation          | Iterations | Time      | Iterations / sec |
|=========================|============|===========|==================|
| fib-iter.bash           | 50         | 0m0.214s  | 234              |
| fib-iter.c.out          | 50         | 0m0.100s  | 500              |
| fib-iter.js             | 50         | 0m2.598s  | 19.25            |
| fib-iter.php            | 50         | 0m2.924s  | 17.10            |
| fib-iter.py             | 50         | 0m1.274s  | 39.25            |
| fib-iter.rb             | 50         | 0m4.257s  | 11.75            |
| fib-logn.c.out          | 50         | 0m0.100s  | 500              |
| fib-logn.py             | 50         | 0m1.204s  | 41.53            |
| fib-memo.cpp.out        | 50         | 0m0.103s  | 485              |
| fib-memo.js             | 50         | 0m2.576s  | 19.41            |
| fib-memo.m.out          | 50         | 0m0.219s  | 228              |
| fib-memo.py             | 50         | 0m1.524s  | 32.81            |
| fib-memo.rb             | 50         | 0m4.411s  | 11.34            |
| fib-unrolled.asm.o      | 50         | 0m0.087s  | 575              |
| fib.asm.o               | 50         | 0m0.089s  | 562              |
| fib.bash                | 1          | *unknown* | *unknown*        |
| fib.c.out               | 50         | 0m17.650s | 2.833            |
| fib.js                  | 50         | 1m2.793s  | 0.796            |
| fib.php                 | 1          | 0m32.872s | 0.030            |
| fib.py                  | 1          | 0m45.071s | 0.022            |
| fib.rb                  | 10         | 2m5.055s  | 0.080            |
| fib.scala               | 10         | 0m47.461s | 0.211            |
| fib-future.scala        | 10         | *unknown* | *unknown*        |
| fib-future-memo.scala   | 10         | 0m5.967s  | 1.676            |
| fib-iter.scala          | 10         | 0m5.896s  | 1.696            |
| fib-memo.scala          | 10         | 0m5.983s  | 1.671            |
| fib-tailrec.scala       | 10         | 0m5.881s  | 1.700            |
