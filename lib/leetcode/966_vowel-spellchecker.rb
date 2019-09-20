
require 'set'
# @param {String[]} wordlist
# @param {String[]} queries
# @return {String[]}
def spellchecker(wordlist, queries)
  words_set = Set.new(wordlist)
  words_cap = {}
  words_vow = {}

  wordlist.each do |word|
    downcase_word = word.downcase
    words_cap[downcase_word] = word unless words_cap.key?(downcase_word)

    vow_encoded_word = encode_vow(downcase_word)
    words_vow[vow_encoded_word] = word unless words_vow.key?(vow_encoded_word)
  end

  results = []

  queries.each do |query|
    if words_set.include?(query)
      results.push(query)
      next
    end

    downcase_query = query.downcase
    if (word = words_cap[downcase_query])
      results.push(word)
    elsif (word = words_vow[encode_vow(downcase_query)])
      results.push(word)
    else
      results.push ''
    end
  end

  results
end

def encode_vow(word)
  word.gsub(/[aeiou]/, '*')
end

wordlist = ["KiTe","kite","hare","Hare"]
queries = ["kite","Kite","KiTe","Hare","HARE","Hear","hear","keti","keet","keto"]

p spellchecker(wordlist, queries)
