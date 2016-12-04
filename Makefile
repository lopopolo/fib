CC=clang
CXX=clang++

ASMFLAGS=-f macho
LDFLAGS=-macosx_version_min 10.7.0 -lSystem -lc /usr/lib/crt1.o
FLAGS=-march=native -O3 -Wall -Wextra -pedantic
CFLAGS=-std=c11 $(FLAGS)
CXXFLAGS=-std=c++11 $(FLAGS)
OBJCFLAGS=-fobjc-arc $(FLAGS)

.PHONY: build clean

all: clean build

build:
	nasm $(ASMFLAGS) fib.asm
	ld $(LDFLAGS) fib.o -o fib.asm.o
	nasm $(ASMFLAGS) fib-unrolled.asm
	ld $(LDFLAGS) fib-unrolled.o -o fib-unrolled.asm.o
	$(CC) $(CFLAGS) fib.c -o fib.c.out
	$(CC) $(CFLAGS) fib-iter.c -o fib-iter.c.out
	$(CC) $(CFLAGS) fib-logn.c -o fib-logn.c.out
	$(CXX) $(CXXFLAGS) fib-memo.cpp -o fib-memo.cpp.out
	$(CC) $(OBJCFLAGS) fib.m -o fib.m.out
	$(CC) $(OBJCFLAGS) fib-memo.m -o fib-memo.m.out

clean:
	-rm -f -- *.o *.out *.class

