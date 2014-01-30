#!/usr/bin/env node

'use strict';

function fib(n) {
  if (n < 2) {
    return 1;
  } else {
    return fib(n - 1) + fib(n - 2);
  }
}

var n = 40;
if (process.argv.length > 2) {
  n = parseInt(process.argv[2]);
}

console.log(fib(n));
