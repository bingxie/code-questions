# @param {Integer[]} a
# @param {Integer[]} b
# @return {Integer[]}
def anagram_mappings(a, b)
  hash = {}

  b.each_with_index do |num, index|
    hash[num] = index
  end

  result = []
  a.each do |num|
    result.push hash[num]
  end

  result
end
