# @param {String} s
# @return {Integer[]}
def partition_labels(s)
  last ={}
  res = []
  s.length.times { |i| last[s[i]] = i }
  l,r= 0,-1
  s.length.times do |i|
    r = [ r, last[s[i]] ].max
    if r == i
      res << r - l + 1
      l = i + 1
    end
  end
  res
end