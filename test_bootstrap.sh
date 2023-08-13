#!/bin/bash

function test() {
  input="$1"

  echo "$input" > tmp.input.rb

  ruby tmp.input.rb > tmp.expected.txt
  ruby main.rb main.rb tmp.input.rb > tmp.actual.txt

  diff tmp.expected.txt tmp.actual.txt > /dev/null
  result=$?
  if [ $result -eq 0 ]; then
    echo -n '.'
  else
    echo Error
    echo '```'
    echo "$input"
    echo '```'
    echo 'Expected:'
    cat tmp.expected.txt
    echo 'Actual:'
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

test \
'p(1 + 2)
p(6 * 7)
p(40 + 2)'

test \
'x = 1
y = 2 + x
p(y)'

test \
'if 0 == 0
  p(42)
else
  p(43)
end'

test \
'i = 0
while i < 10
  p(i)
  i = i + 1
end'

test \
'case 42
when 0
  p(0)
when 1
  p(1)
else
  p(2)
end'

# FizzBuzz
test \
'i = 0
while i <= 100
  if i % 15 == 0
    p("FizzBuzz")
  elsif i % 3 == 0
    p("Fizz")
  elsif i % 5 == 0
    p("Buzz")
  else
    p(i)
  end
  i = i + 1
end'

test \
'i = 10
begin
  p(i)
  i = i - 1
end while i > 0'

test \
'def add(a, b)
  a + b
end

p(add(1, 2))'

test \
'def foo()
  x = 0
  p(x)
end

x = 1
foo()
p(x)'

test \
'def fibo(n)
  if n <= 1
    n
  else
    fibo(n - 1) + fibo(n - 2)
  end
end

p(fibo(5))'

test \
'ary = [1, 2, 3]
p(ary[0])
p(ary[1])
p(ary[2])'

test \
'ary = [1, 2, 3]
ary[0] = 42
p(ary[0])
p(ary[1])
p(ary[2])'

test \
'hsh = { 1 => 10, 2 => 20, 3 => 30 }
hsh[0] = 42
p(hsh[0])
p(hsh[1])
p(hsh[2])
p(hsh[3])'

echo OK
