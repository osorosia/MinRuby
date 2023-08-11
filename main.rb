require "minruby"

def evaluate(tree)
  case tree[0]
  when "lit"
    tree[1]
  when "+"
    evaluate(tree[1]) + evaluate(tree[2])
  when "-"
    evaluate(tree[1]) - evaluate(tree[2])
  when "*"
    evaluate(tree[1]) * evaluate(tree[2])
  when "/"
    evaluate(tree[1]) / evaluate(tree[2])
  when "%"
    evaluate(tree[1]) % evaluate(tree[2])
  when "**"
    evaluate(tree[1]) ** evaluate(tree[2])
  when "=="
    evaluate(tree[1]) == evaluate(tree[2])
  when "!="
    evaluate(tree[1]) != evaluate(tree[2])
  when "<"
    evaluate(tree[1]) < evaluate(tree[2])
  when "<="
    evaluate(tree[1]) <= evaluate(tree[2])
  when ">"
    evaluate(tree[1]) > evaluate(tree[2])
  when ">="
    evaluate(tree[1]) >= evaluate(tree[2])
  when "func_call"
    p(evaluate(tree[2]))
  else
    p("invalid tree")
    exit(1)
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
  str = minruby_load()
  tree = minruby_parse(str)
  answer = evaluate(tree)
end

main
