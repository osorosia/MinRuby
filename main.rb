require "minruby"

def evaluate(tree)
  if tree[0] == "lit"
    tree[1]
  else
    left = evaluate(tree[1])
    right = evaluate(tree[2])
    if tree[0] == "+"
      left + right
    elsif tree[0] == "-"
      left - right
    elsif tree[0] == "*"
      left * right
    else
      left / right
    end
  end
end

def main
  str = gets
  tree = minruby_parse(str)
  answer = evaluate(tree)
  p(answer)
end

main
