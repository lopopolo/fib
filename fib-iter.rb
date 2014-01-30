#!/usr/bin/env ruby

def fib(n)
  a, b = 1, 1
  n.times do
    a, b = b, b + a
  end
  a
end

if $0 == __FILE__
  n = (ARGV[0] || 40).to_i
  puts fib(n)
end
