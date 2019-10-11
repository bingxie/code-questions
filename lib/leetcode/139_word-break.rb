# @param {String} s
# @param {String[]} word_dict
# @return {Boolean}
def word_break(str, word_dict)
  word_break_helper(str, word_dict, 0)
end

def word_break_helper(str, word_dict, start, memo = [])
  return true if start == str.length

  return memo[start] unless memo[start].nil?

  (start..str.length).each do |ending|
    return memo[start] = true if word_dict.include?(str[start..ending]) && word_break_helper(str, word_dict, ending + 1, memo)
  end

  memo[start] = false
end

s = "leetcode"
wordDict = ["leet", "code"]

p word_break(s, wordDict) # true

s = "applepenapple"
wordDict = ["apple", "pen"]

p word_break(s, wordDict) # true

s = "catsandog"
wordDict = ["cats", "dog", "sand", "and", "cat"]

p word_break(s, wordDict) # false

s = "a"
wordDict = ["a"]

p word_break(s, wordDict) # true
