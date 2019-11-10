# @param {String[]} words
# @param {String} order
# @return {Boolean}
def is_alien_sorted(words, order)
  words.each_cons(2) do |word1, word2|   # 注意each_cons 和 each_slice的区别
      a = word1[0]
      b = word2[0]

      j = 1
      while a == b
          a = word1[j]
          b = word2[j]
          j += 1
      end

      return false if b.nil?
      return false if order.index(a) > order.index(b)
  end

  true
end
