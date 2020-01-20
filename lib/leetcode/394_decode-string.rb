# @param {String} s
# @return {String}
# 参考: https://www.youtube.com/watch?v=Qoz3ujccNQY&t=4s
def decode_string(str)
  num_stack = []
  str_stack = []

  i = 0
  length = str.length
  tail = ''

  while i < length
    char = str[i]

    if char.match?(/\d/)
      num = char.to_i
      while i + 1 < length && str[i + 1].match?(/\d/)
        num = num * 10 + str[i + 1].to_i
        i += 1
      end
      num_stack.push num
    elsif char == '['
      str_stack.push tail
      tail = ''
    elsif char == ']'
      tmp = str_stack.pop

      repeat_times = num_stack.pop
      tmp += tail * repeat_times
      tail = tmp
    else
      tail += char
    end

    i += 1
  end

  tail
end

str = '2[b4[F]c]'
p decode_string(str)

s = '3[a]2[bc]'
p decode_string(s)

s = '2[abc]3[cd]ef'
p decode_string(s)

def decode_string2(s)
  stack = []

  s.each_char do |char|
    if char == ']'
      temp_char_string = ''

      while (temp_char = stack.pop) != '['
        temp_char_string << temp_char
      end

      number = ''

      number << stack.pop while stack[-1]&.match(/\d/)
      number = number.reverse.to_i

      temp_char_string = temp_char_string.reverse * number
      temp_char_string.each_char { |ch| stack.push(ch) }
    else
      stack.push(char)
    end

    pp stack
  end
  stack.join('')
end

s = '3[a]2[bc]'
p decode_string2(s)
