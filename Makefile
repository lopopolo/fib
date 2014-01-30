CC=clang
CXX=clang++

FLAGS=-march=native -O4 -Wall -Wextra -pedantic
CFLAGS=-std=c11 $(FLAGS)
CXXFLAGS=-std=c++11 $(FLAGS)
OBJCFLAGS=-fobjc-arc $(FLAGS)

.PHONY: build clean

all: clean build

build:
	$(CC) $(CFLAGS) fib.c -o fib.c.out
	$(CC) $(CFLAGS) fib-iter.c -o fib-iter.c.out
	$(CXX) $(CXXFLAGS) fib-memo.cpp -o fib-memo.cpp.out
	$(CC) $(OBJCFLAGS) fib.m -o fib.m.out
	$(CC) $(OBJCFLAGS) fib-memo.m -o fib-memo.m.out

clean:
	-rm -f -- *.o *.out *.class

