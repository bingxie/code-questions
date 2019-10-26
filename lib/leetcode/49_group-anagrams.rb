# @param {String[]} strs
# @return {String[][]}
def group_anagrams(strs)
  mappings = {}

  strs.each do |str|
    key = str.chars.sort

    if mappings[key]
      mappings[key].push str
    else
      mappings[key] = [str]
    end
  end

  mappings.values
end

strs = ["eat", "tea", "tan", "ate", "nat", "bat"]
p group_anagrams(strs)
