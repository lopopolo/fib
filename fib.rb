#!/usr/bin/env ruby

def fib(n)
  (n < 2 && 1) || fib(n - 1) + fib(n - 2)
end

if $0 == __FILE__
  n = (ARGV[0] || 40).to_i
  puts fib(n)
end
