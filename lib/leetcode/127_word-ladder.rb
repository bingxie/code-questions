def ladder_length(begin_word, end_word, word_list)
  return 0 unless word_list.include?(end_word)

  word_set = Set.new word_list

  queue = [[begin_word, 1]]

  until queue.empty?
    pointer, level = queue.shift

    return level if pointer == end_word

    pointer.size.times do |i|
      left = pointer[0...i]
      right = pointer[(i + 1)...pointer.size]
      ('a'..'z').each do |c|
        next if c == pointer[i]

        temp = left + c + right
        if word_set.include?(temp)
          word_set.delete(temp)
          queue << [temp, level + 1]
        end
      end
    end
  end
  0
end
