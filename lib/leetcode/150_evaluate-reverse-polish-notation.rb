# @param {String[]} tokens
# @return {Integer}
def eval_rpn(tokens)
  operators = ['+', '-', '*', '/']

  return tokens[0].to_i if tokens.size == 1 # edgecase： 只有一个元素的情况

  stack = []
  result = 0

  tokens.each do |token|
    if operators.include?(token)
      num1 = stack.pop
      num2 = stack.pop
      result = num2.send(token, num1).to_i # 此处需要注意顺序
      stack.push result
    else
      stack.push token.to_f
    end
    p stack
  end

  result
end

tokens = ['2', '1', '+', '3', '*']
p eval_rpn(tokens) # 9

tokens = ['4', '13', '5', '/', '+']
p eval_rpn(tokens) # 6

tokens = ['10', '6', '9', '3', '+', '-11', '*', '/', '*', '17', '+', '5', '+']
p eval_rpn(tokens)
