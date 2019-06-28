# @param {String} s
# @return {Integer}
def first_uniq_char(s)
  hash = Hash.new(0)

  s.each_char {|x| hash[x] += 1}
  s.each_char.with_index {|x, i| return i if hash[x] == 1}
  -1
end