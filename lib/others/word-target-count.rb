# Tags: #Hash
# abc bcd def abc bcd efg

def word_target_count(sentence, target)
  words = sentence.split

  words_count = Hash.new(0)
  # first = nil
  results = []
  words.each do |word|
    words_count[word] += 1
    #first = word if words_count[word] == 2 && first.nil?
    results.push(word) if words_count[word] == 2
  end

  p words_count
  p results.first
  p results.last
end

sentence = "abc bcd def abc bcd efg"

word_target_count(sentence, 2)
