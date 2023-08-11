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
    elsif tree[0] == "/"
      left / right
    elsif tree[0] == "%"
      left % right
    elsif tree[0] == "**"
      left ** right
    elsif tree[0] == "=="
      left == right
    elsif tree[0] == "!="
      left != right
    elsif tree[0] == "<"
      left < right
    elsif tree[0] == "<="
      left <= right
    elsif tree[0] == ">"
      left > right
    elsif tree[0] == ">="
      left >= right
    else
      p("invalid tree")
      exit(1)
    end
  end
end

def max(tree)
  if tree[0] == "lit"
    tree[1]
  else
    left = max(tree[1])
    right = max(tree[2])
    if left >= right
      left
    else
      right
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
