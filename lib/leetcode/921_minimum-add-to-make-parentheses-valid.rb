# @param {String} s
# @return {Integer}
def min_add_to_make_valid(s)
  stack = []

  s.chars.each do |char|
    if char == ')' && (stack.size > 0 && stack[stack.size - 1] == '(')
      stack.pop
    else
      stack.push char
    end
  end

  stack.size
end

p min_add_to_make_valid("()))((")
