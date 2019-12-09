# 使用hash count来对是否包含子字符串进行匹配,优化速度
# @param {String} s
# @param {String} t
# @return {String}
def min_window(s, t)
  return '' if s.size < t.size

  t_hash = Hash.new(0)
  t.chars.each do |char|
    t_hash[char] += 1
  end

  left = 0
  right = left + t.size - 1

  result = ''

  s_hash = Hash.new(0)

  s[left..right].chars.each do |char|
    s_hash[char] += 1
  end

  while left <= right && right < s.size

    if contains_subtring?(s_hash, t_hash)
      result = s[left..right] if result == ''

      result = s[left..right] if s[left..right].size < result.size

      s_hash[s[left]] -= 1
      left += 1
    else
      right += 1
      s_hash[s[right]] += 1 if right != s.size
    end
  end

  result
end

def contains_subtring?(s_hash, t_hash)
  t_hash.each do |char, count|
    return false if s_hash[char] < count
  end

  true
end

s = 'ABAACBAB'
t = 'ABC'

p min_window(s, t)  # ACB

s = 'ADOBECODEBANC'
t = 'ABC'

p min_window(s, t)  # BANC


s = 'a'
t = 'b'

p min_window(s, t)
