#!/usr/bin/env node

'use strict';

function fib(n) {
  var a = 1, b = 1;
  for (var i=0; i < n; ++i) {
    var temp = b;
    b = a + b;
    a = temp;
  }
  return a;
}

var n = 40;
if (process.argv.length > 2) {
  n = parseInt(process.argv[2]);
}

console.log(fib(n));
