# @param {String} s
# @param {String} p
# @return {Integer[]}
def find_anagrams(s, p)
  p_hash = Hash.new(0)

  p.each_char do |char|
    p_hash[char] += 1
  end

  i = 0
  s_hash = Hash.new(0)
  prev_i = nil
  result = []

  s.chars.each_with_index do |char, j|
    s_hash[char] += 1

    if j > p.size - 1
      s_hash[prev_i] -= 1
      s_hash.delete(prev_i) if s_hash[prev_i] == 0
    end

    result.push i if s_hash == p_hash

    if (j - i) == p.size - 1
      prev_i = s[i]
      i += 1
    end
  end

  result
end

s = "cbaebabacd"
p = "abc"

p find_anagrams(s, p)

s = "abab"
p = "ab"
p find_anagrams(s, p)


def find_anagrams2(s, p)
  p_size = p.size

  result = []

  p_array = Array.new(26, 0)
  s_array = Array.new(26, 0)

  p.each_char do |char|
    p_array[char.ord - 'a'.ord] += 1
  end

  s.chars.each_with_index do |char, index|
    s_array[s[index - p_size].ord - 'a'.ord] -= 1 if index >= p_size

    s_array[char.ord - 'a'.ord] += 1

    result.push(index + 1 - p_size) if p_array == s_array
  end

  result
end

s = "cbaebabacd"
p = "abc"

p find_anagrams2(s, p)
