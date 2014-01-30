#!/usr/bin/env bash

function fib
{
	local n="$1"
	if (( $n < 2 )); then
		echo "1"
	else
		echo $(expr $(fib $(expr $n - 1)) + $(fib $(expr $n - 2)))
	fi
}

n=$1
if [ -z "$n" ]; then
  n="40"
fi

fib "$n"
