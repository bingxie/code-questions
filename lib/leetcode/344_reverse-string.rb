def reverse_string(string)
  return if string.length < 2

  start_index = 0
  end_index = string.length - 1

  while start_index < end_index
    string[start_index], string[end_index] = string[end_index], string[start_index]

    start_index += 1
    end_index -= 1
  end
 end
