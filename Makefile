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

build: scala clang

clang:
	nasm $(ASMFLAGS) fib.asm
	ld $(LDFLAGS) fib.o -o fib.asm.o
	nasm $(ASMFLAGS) fib-unrolled.asm
	ld $(LDFLAGS) fib-unrolled.o -o fib-unrolled.asm.o
	$(CC) $(CFLAGS) fib.c -o fib.c.out
	$(CC) $(CFLAGS) fib-iter.c -o fib-iter.c.out
	$(CC) $(CFLAGS) fib-logn.c -o fib-logn.c.out
	$(CXX) $(CXXFLAGS) fib-memo.cpp -o fib-memo.cpp.out
	$(CC) $(OBJCFLAGS) fib-memo.m -o fib-memo.m.out

scala:
	mkdir -p dist
	mkdir -p dist/fib-future-memo
	scalac -d dist/fib-future-memo fib-future-memo.scala
	mkdir -p dist/fib-future
	scalac -d dist/fib-future fib-future.scala
	mkdir -p dist/fib-iter
	scalac -d dist/fib-iter fib-iter.scala
	mkdir -p dist/fib-memo
	scalac -d dist/fib-memo fib-memo.scala
	mkdir -p dist/fib-tailrec
	scalac -d dist/fib-tailrec fib-tailrec.scala
	mkdir -p dist/fib
	scalac -d dist/fib fib.scala

clean:
	-rm -rf -- *.o *.out *.class dist

bench: bench-exe bench-scala

bench-exe:
	find . -perm +0111 -depth 1 -type f | grep -v fib.bash | grep -v fib.php | grep -v fib.rb | xargs -n 1 -I % bash -c 'echo -e "%"; time for i in $$(seq 50); do % > /dev/null; done'

bench-scala:
	time for i in `seq 10`; do scala -classpath dist/fib Main > /dev/null; done
	time for i in `seq 10`; do scala -classpath dist/fib-future-memo Main > /dev/null; done
	time for i in `seq 10`; do scala -classpath dist/fib-iter Main > /dev/null; done
	time for i in `seq 10`; do scala -classpath dist/fib-memo Main > /dev/null; done
	time for i in `seq 10`; do scala -classpath dist/fib-tailrec Main > /dev/null; done

