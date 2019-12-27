# 参考： https://www.youtube.com/watch?v=YSRUTMThBfU

require 'set'
# @param {String} s
# @return {String[]}

def remove_invalid_parentheses(s)
  @results = Set.new
  @min_removed = Float::INFINITY

  recurse(s, 0, 0, 0, [], 0)
  @results.to_a
end

def recurse(s, index, left_count, right_count, expression, removed_count)
  puts "expression: #{expression}"
  # If we have reached the end of string.
  if index == s.length
    # If the current expression is valid.
    if left_count == right_count
      # If the current count of removed parentheses is <= the current minimum count
      if removed_count <= @min_removed
        possible_answer = expression.join

        # If the current count beats the overall minimum we have till now, reset
        if removed_count < @min_removed
          @results.clear
          @min_removed = removed_count
        end

        @results.add possible_answer
      end
    end
  else
    length = expression.size
    current_char = s[index]

    # If the current character is neither an opening bracket nor a closing one
    if current_char != '(' && current_char != ')'
      expression.push current_char
      recurse(s, index + 1, left_count, right_count, expression, removed_count)
      expression.delete_at(length)
    else
      # Recursion where we delete the current character and move forward
      recurse(s, index + 1, left_count, right_count, expression, removed_count + 1)

      # when we keep
      expression.push current_char
      # If it's an opening parenthesis, consider it and recurse
      if current_char == '('
        recurse(s, index + 1, left_count + 1, right_count, expression, removed_count)
      elsif right_count < left_count
        # For a closing parenthesis, only recurse if right < left
        recurse(s, index + 1, left_count, right_count + 1, expression, removed_count)
      end

      # Undoing the append operation for other recursions, backtracing
      expression.delete_at(length)
    end
  end
end


s = '(()(()'
p remove_invalid_parentheses(s)

s = "()())()"
# p remove_invalid_parentheses(s)
