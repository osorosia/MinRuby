#!/bin/bash

function test() {
  input="$1"

  echo "$input" > tmp.input.rb

  ruby tmp.input.rb > tmp.expected.txt
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

test 'p(1 + 2)'
test 'p((1 + 2) / 3 * 4 * (56 / 7 + 8 + 9))'
test 'p(8 % 3)'
test 'p(2 ** 4)'

test 'p(1 == 1)'
test 'p(1 == 2)'
test 'p(1 != 1)'
test 'p(1 != 2)'
test 'p(2 * 3 > 2 + 3)'
test 'p(2 * 3 < 2 + 3)'
test 'p(2 * 3 >= 2 + 3)'
test 'p(2 * 3 <= 2 + 3)'

echo OK
