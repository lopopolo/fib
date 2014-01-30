.PHONY: build clean

build:
	clang -O3 -fobjc-arc fib.m -o fib.m.out
	clang -O3 -fobjc-arc fib-memo.m -o fib-memo.m.out
	clang -O3 fib.c -o fib.c.out

clean:
	-rm -f -- *.o *.out *.class

