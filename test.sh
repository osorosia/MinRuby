#!/bin/bash

function test() {
  expected="$1"
  input="$2"

  echo "$input" > tmp.input.txt

  echo "$expected" > tmp.expected.txt
  ruby main.rb < tmp.input.txt > tmp.actual.txt

  diff tmp.expected.txt tmp.actual.txt > /dev/null
  result=$?
  if [ $result -eq 0 ]; then
    echo -n '.'
  else
    echo -n "$input => $expected expected, but got "
    cat tmp.actual.txt
    exit 1
  fi
}

test 3 '1 + 2'
test 100 '(1 + 2) / 3 * 4 * (56 / 7 + 8 + 9)'
test 2 '8 % 3'
test 16 '2 ** 4'
echo OK
