# @param {String} j
# @param {String} s
# @return {Integer}
def num_jewels_in_stones(j, s)
  hash = {}

  j.each_char { |c| hash[c] = 0}

  s.each_char { |c| hash[c] = hash[c] + 1 if hash[c] }

  hash.inject(0) { |sum, (k,v)| sum + v}
end


j = 'aA'
s = 'aAAabbbb'

pp num_jewels_in_stones(j, s)