# @param {String} s
# @return {Boolean}
def is_valid(s)
  pairs = {'(' => ')', '{' => '}', '[' => ']'}

  left_brackets = pairs.keys
  right_brackets = pairs.values

  stack = []

  s.each_char do |c|
    if left_brackets.include?(c)
      stack.push(c)
    elsif right_brackets.include?(c)
      return false if stack.empty?

      prev = stack.pop
      return false if pairs[prev] != c  #check equal
    end
  end

  stack.empty?
end

puts is_valid("()") # true
puts is_valid("()[]{}") # true
puts is_valid("(]") # false
puts is_valid("([)]") # false
puts is_valid("{[]}") # true
