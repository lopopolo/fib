#!/usr/bin/env php
<?php

function fib($n) {
  $a = 1;
  $b = 1;
  $temp = 0;
  for ($i = 0; $i < $n; ++$i) {
    $temp = $b;
    $b = $a + $b;
    $a = $temp;
  }
  return $a;
}

$n = 40;
if (count($argv) > 1) {
  $n = (integer) $argv[1];
}

echo fib($n) . PHP_EOL;

