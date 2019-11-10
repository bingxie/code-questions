# @param {String} s
# @param {String} t
# @return {Boolean}
def is_anagram(s, t)
  return false if s.size != t.size

  s_sorted = s.chars.sort
  t_sorted = t.chars.sort

  s_sorted == t_sorted
end

s = 'anagram'
t = 'nagaram'
p is_anagram(s, t) # true

s = 'rat'
t = 'car'
p is_anagram(s, t) # false

def is_anagram2(s, t)
  s_length = s.length
  t_length = t.length
  counter = Hash.new(0)

  return false unless s_length == t_length

  (0...s_length).each do |i|
    counter[s[i]] += 1
    counter[t[i]] -= 1
  end

  counter.each do |_k, v|
    return false unless v == 0
  end

  true
end

s = 'anagram'
t = 'nagaram'
p is_anagram2(s, t) # true

s = 'rat'
t = 'car'
p is_anagram2(s, t) # false
