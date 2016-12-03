#!/usr/bin/env bash

function fib
{
	local n="$1"
	local a="1"
	local b="1"
	local temp="0"
	while (( n > 0 )); do
		temp="$b"
		b="$(( a + b ))"
		a="$temp"
		n=$(( n - 1 ))
	done
	echo "$a"
}

n=$1
if [ -z "$n" ]; then
  n="40"
fi

fib "$n"
