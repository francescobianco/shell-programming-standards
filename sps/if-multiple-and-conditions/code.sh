#!/usr/bin/env sh

a=1
b=2
c=3
if [ $a -lt $b ] && [ $b -lt $c ]; then
  echo "We have that: $a < $b < $c"
fi
