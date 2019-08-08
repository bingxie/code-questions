def encode(strs)
  (strs + [" "]).map do |str|
    str.gsub('X', 'Xi')
  end.join("XX")
end

def decode(str)
  strs = str.split('XX').map { |s| s.gsub('Xi', 'X') }
  strs.pop
  strs
end

strs = %w[Xie Bing is a good man. !!!]
p decode(encode(strs)) == strs

p encode([""])
p decode("XX ")

p encode([])
p decode(" ")
