#!/usr/bin/env bash

function fib
{
	local n="$1"
	if (( n < 2 )); then
		echo "1"
	else
		local n1="$(( n - 1 ))"
		local n2="$(( n - 2 ))"
		echo "$(( $(fib "$n1") + $(fib "$n2") ))"
	fi
}

n=$1
if [ -z "$n" ]; then
	n="40"
fi

fib "$n"
