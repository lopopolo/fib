#!/usr/bin/env php
<?php

function fib($n) {
  if ($n < 2) {
    return 1;
  } else {
    return fib($n - 1) + fib($n - 2);
  }
}

$n = 40;
if (count($argv) > 1) {
  $n = (integer) $argv[1];
}

echo fib($n) . PHP_EOL;

