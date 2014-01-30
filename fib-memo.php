#!/usr/bin/env php
<?php

class Memoize {
  private $cache = array();
  private $f;

  public function __construct(callable $f) {
    $this->f = $f;
  }


  public function apply1($n) {
    if (isset($this->cache[$n])) {
      return $this->cache[$n];
    } else {
      $f = $this->f;
      $this->cache[$n] = $f($n);
      return $this->cache[$n];
    }
  }
}

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

echo (new Memoize('fib'))->apply1($n) . PHP_EOL;

