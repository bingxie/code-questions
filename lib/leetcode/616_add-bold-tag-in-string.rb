# @param {String} s
# @param {String[]} dict
# @return {String}
def add_bold_tag(str, dict)
  ranges = []

  str.length.times do |i|
    dict.each do |word|
      if str[i...i+word.length] == word
        ranges << [i, i + word.length - 1]
      end
    end
  end

  merged_ranges = merge(ranges)
  (merged_ranges.length - 1).downto(0) do |i|  # 从后面开始
    first_i = merged_ranges[i][0]
    last_i = merged_ranges[i][1]

    str.insert(last_i + 1, "</b>")  # 后面的下标要+1
    str.insert(first_i, "<b>")
  end
  str
end

def merge(intervals)
  return [] if intervals.empty?

  # intervals.sort!

  results = []
  latest_start, latest_end = intervals.first
  results.push [latest_start, latest_end]

  intervals[1..-1].each do |new_start, new_end|
    if new_start <= latest_end + 1  # 字符靠近的也要连在一起
      latest_end = [latest_end, new_end].max
      results[-1] = [latest_start, latest_end]
    else
      results.push [new_start, new_end]
      latest_start = new_start
      latest_end = new_end
    end
  end

  results
end

s = 'abcxyz123'
dict = %w[abc 123]
p add_bold_tag(s, dict) == "<b>abc</b>xyz<b>123</b>"

s = 'aaabbcc'
dict = ["bc", "aab", "aaa"]
p add_bold_tag(s, dict) == "<b>aaabbc</b>c"
