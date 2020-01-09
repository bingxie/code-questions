# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
  return '' if strs&.empty?

  shortest = strs.min_by(&:size)

  prefix = ''
  shortest.chars.each_with_index do |char, index|
    if strs.all? { |str| str[index] == char }
      prefix += char
    else
      break
    end
  end

  prefix
end

strs = %w[flower flow flight]
p longest_common_prefix(strs)

strs = %w[dog racecar car]
p longest_common_prefix(strs)

# Approach2:
def longest_common_prefix2(strs)
  return '' if strs&.empty?

  lcp = strs[0]

  strs[1..-1].each do |str|
    j = 0

    j += 1 while j < lcp.length && j < str.length && str[j] == lcp[j]

    lcp = lcp[0...j]

    break if lcp == ''
  end

  lcp
end

strs = %w[flower flow flight]
p longest_common_prefix2(strs)

strs = %w[dog racecar car]
p longest_common_prefix2(strs)
