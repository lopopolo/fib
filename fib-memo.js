#!/usr/bin/env node

'use strict';

var cache = {};

var fib = function fib(n) {
  var r = cache[n];
  if (r === undefined) {
    if (n < 2) {
      r = 1;
    } else {
      r = fib(n - 1) + fib(n - 2);
    }
    cache[n] = r;
  }
  return r;
}

var n = 40;
if (process.argv.length > 2) {
  n = parseInt(process.argv[2]);
}

console.log(fib(n));
