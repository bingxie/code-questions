def encode(strs)
  strs.map do |str|
    "#{str.length}ā#{str}"
  end.join
end

def decode(str)
  result = []
  until str.empty?
    delimiter_index = str.index("ā")
    length = str[delimiter_index - 1].to_i
    # if length == 0
    #   result.push ''
    #   break
    # end
    result.push(str[(delimiter_index+1)..(delimiter_index+length)])
    str = str[delimiter_index+1+length..-1]
  end
  result
end

strs = %w[Xie Bing is a good man. !!!]
p encode(strs)
p decode("3āXie4āBing2āis1āa4āgood4āman.3ā!!!")

p encode([""])
p decode("0ā")

p encode([])
p decode("")