def reverse_words!(message)
  reverse_chars!(message, 0, message.size - 1)

  word_start_index = 0
  message.chars.each_with_index do |char, index|
    if char == ' '
      reverse_chars!(message, word_start_index, index - 1)
      word_start_index = index + 1
    elsif index == message.size - 1
      reverse_chars!(message, word_start_index, index)
    else
      next
    end
  end
end

def reverse_chars!(string, start_index, end_index)
  while start_index < end_index
    string[start_index], string[end_index] = string[end_index], string[start_index]

    start_index += 1
    end_index -= 1
  end
end

message = 'thief cake'
#p reverse_chars!(message, 0, message.size - 1)
reverse_words!(message)
p message
