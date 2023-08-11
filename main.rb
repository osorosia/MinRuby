require "minruby"

def evaluate(tree, env)
  case tree[0]
  when "lit"
    tree[1]
  when "+"
    evaluate(tree[1], env) + evaluate(tree[2], env)
  when "-"
    evaluate(tree[1], env) - evaluate(tree[2], env)
  when "*"
    evaluate(tree[1], env) * evaluate(tree[2], env)
  when "/"
    evaluate(tree[1], env) / evaluate(tree[2], env)
  when "%"
    evaluate(tree[1], env) % evaluate(tree[2], env)
  when "**"
    evaluate(tree[1], env) ** evaluate(tree[2], env)
  when "=="
    evaluate(tree[1], env) == evaluate(tree[2], env)
  when "!="
    evaluate(tree[1], env) != evaluate(tree[2], env)
  when "<"
    evaluate(tree[1], env) < evaluate(tree[2], env)
  when "<="
    evaluate(tree[1], env) <= evaluate(tree[2], env)
  when ">"
    evaluate(tree[1], env) > evaluate(tree[2], env)
  when ">="
    evaluate(tree[1], env) >= evaluate(tree[2], env)
  when "func_call"
    p(evaluate(tree[2], env))
  when "stmts"
    i = 1
    last = nil
    while tree[i] != nil
      last = evaluate(tree[i], env)
      i = i + 1
    end
    last
  when "var_assign"
    env[tree[1]] = evaluate(tree[2], env)
  when "var_ref"
    env[tree[1]]
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
  env = {}
  str = minruby_load()
  tree = minruby_parse(str)
  answer = evaluate(tree, env)
end

main
