# @param {String} s
# @param {String} t
# @return {Boolean}
def is_one_edit_distance(s, t)
  s_size = s.size
  t_size = t.size

  return is_one_edit_distance(t, s) if s_size > t_size

  return false if t_size - s_size > 1

  s.each_char.with_index do |char, index|
    if char != t[index]
      if s_size == t_size
        return s[index + 1...s_size] == t[index + 1...t_size]
      else
        return s[index...s_size] == t[index + 1...t_size]
      end
    end
  end

  s_size + 1 == t_size
end

s = 'ab'
t = 'acb'
p is_one_edit_distance(s, t) # true

s = 'abc'
t = 'adc'
p is_one_edit_distance(s, t) # true

s = 'abd'
t = 'ade'
p is_one_edit_distance(s, t) # true

s = 'ab'
t = 'abcd'
p is_one_edit_distance(s, t) # true
