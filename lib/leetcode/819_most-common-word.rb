# @param {String} paragraph
# @param {String[]} banned
# @return {String}
def most_common_word(paragraph, banned)
  words = paragraph.split(/\W+/)

  count_words = Hash.new(0)

  words.each do |word|
    new_word = word.downcase
    next if banned.include?(new_word)

    count_words[new_word] += 1
  end

  sorted_words = count_words.sort_by { |_key, value| value }
  sorted_words.last.first
end

paragraph = 'Bob hit a ball, the hit BALL flew far after it was hit.'
banned = ['hit']

p most_common_word(paragraph, banned)
