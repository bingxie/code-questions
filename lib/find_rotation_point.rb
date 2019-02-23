module FindRotationPoint
  def self.call(words)
    first_word = words.first  # 找到比较的对象非常重要

    floor_index = 0
    ceiling_index = words.length - 1

    while floor_index < ceiling_index
      guess_point = floor_index + (ceiling_index - floor_index) / 2

      if words[guess_point] >= first_word # 注意 =，也就是 guess_index 跑到最前面的情况
        floor_index = guess_point
      else
        ceiling_index = guess_point
      end

      # return if floor and ceiling have converged
      # between floor and ceiling is where we flipped to the beginning
      # so ceiling is alphabetically first
      return ceiling_index if floor_index + 1 == ceiling_index
    end
  end
end
