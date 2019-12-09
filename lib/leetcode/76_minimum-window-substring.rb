# @param {String} s
# @param {String} t
# @return {String}
def min_window(s, t)
  return '' if s.size < t.size

  left = 0
  right = left + t.size - 1

  result = ''

  while left <= right && right < s.size
    if contains_subtring?(s[left..right], t)
      result = s[left..right] if result == ''

      result = s[left..right] if s[left..right].size < result.size

      left += 1
    else
      right += 1
    end
  end

  result
end

def contains_subtring?(string, sub)
  chars = string.chars

  sub.chars.each do |char|
    if index = chars.find_index(char)
      chars.delete_at(index)
    else
      return false
    end
  end

  true
end

s = 'ABAACBAB'
t = 'ABC'

p min_window(s, t)

s = 'ADOBECODEBANC'
t = 'ABC'

p min_window(s, t)


s = 'a'
t = 'b'

p min_window(s, t)
