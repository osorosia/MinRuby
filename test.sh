#!/bin/bash

function test() {
  expected="$1"
  input="$2"

  echo "$input" > tmp.input.rb

  echo "$expected" > tmp.expected.txt
  ruby main.rb tmp.input.rb > tmp.actual.txt

  diff tmp.expected.txt tmp.actual.txt > /dev/null
  result=$?
  if [ $result -eq 0 ]; then
    echo -n '.'
  else
    echo Error
    echo -n "$input => $expected expected, but got "
    cat tmp.actual.txt
    exit 1
  fi
}

test 3 'p(1 + 2)'
test 100 'p((1 + 2) / 3 * 4 * (56 / 7 + 8 + 9))'
test 2 'p(8 % 3)'
test 16 'p(2 ** 4)'

test true 'p(1 == 1)'
test false 'p(1 == 2)'
test false 'p(1 != 1)'
test true 'p(1 != 2)'
test true 'p(2 * 3 > 2 + 3)'
test false 'p(2 * 3 < 2 + 3)'
test true 'p(2 * 3 >= 2 + 3)'
test false 'p(2 * 3 <= 2 + 3)'

echo OK
