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
      prev = stack.pop
      return false if pairs[prev] != c
    end
  end

  stack.empty?
end

puts is_valid("()")
puts is_valid("()[]{}")
puts is_valid("(]")
puts is_valid("([)]")
puts is_valid("{[]}")