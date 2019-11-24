# @param {String} s
# @return {Integer}
# Approach 1: Brute Force  (Time Limit Exceeded)
def length_of_longest_substring(str)
  size = str.length

  result = 0

  (0..size - 1).each do |i|
    (1..size).each do |j|
      result = [result, j - i].max if all_unique(str, i, j)
    end
  end

  result
end

def all_unique(str, s_index, e_index)
  chars = str[s_index...e_index].chars

  chars.size == chars.uniq.size
end

str = "abcabcbb"
p length_of_longest_substring(str) # 3

str = 'bbbb'
p length_of_longest_substring(str) # 1

str = "pwwkew"
p length_of_longest_substring(str) # 3

# @param {String} s
# @return {Integer}
# Approach 2: Sliding Window
require 'set'
def length_of_longest_substring2(str)
  length = str.length

  set = Set.new

  result = 0
  i = 0
  j = 0

  while i < length && j < length
    if set.include? str[j]
      set.delete str[i]
      i += 1
    else
      set.add(str[j])
      j += 1
      result = [result, j - i].max
    end
  end

  result
end

str = "abcabcbb"
p length_of_longest_substring2(str)

def length_of_longest_substring3(str)
  length = str.length
  result = 0

  hash = {}

  i = 0

  (0..length - 1).each do |j|
    if hash.key?(str[j])
      i = [hash[str[j]], i].max
    end

    result = [result, j - i + 1].max

    hash[str[j]] = j + 1
  end

  result
end

str = "abcabcbb"
p length_of_longest_substring3(str)
