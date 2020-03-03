# @param {String[]} products
# @param {String} search_word
# @return {String[][]}
# 756 ms
def suggested_products(products, search_word)
  results = []

  products.sort!

  (0...search_word.size).each do |length|
    p search_word[0..length]
    results.push products.grep(Regexp.new("^#{search_word[0..length]}")).first(3)
  end
  results
end

# 280 ms
# 优化后： 80 ms
def suggested_products2(products, search_word)
  products.sort!
  p products
  res = []
  i = 0
  j = 0

  while i < search_word.length
    suggestions = []
    str = search_word[0..i]
    p "str: #{str} j: #{j}"
    add_j = true
    products[j..-1].each do |p|
      break if suggestions.length == 3 # 找到3个后立即返回，节省时间

      unless p.start_with?(str) # 优化查找的数量
        j += 1 if add_j
        next
      end

      suggestions << p
      add_j = false
    end

    res << suggestions
    i += 1
  end

  res
end

products = %w[mobile mouse moneypot monitor mousepad]
search_word = 'mouse'

p suggested_products2(products, search_word)

products = %w[abc bcd cde cdef cdf cdg]
search_word = 'cde'

# p suggested_products2(products, search_word)

products = %w[bags baggage banner box cloths]
search_word = 'bags'

p suggested_products2(products, search_word)

class Trie
  attr_accessor :ending, :children, :suggestions
  def initialize
    @suggestions = []
    @children = {}
    @ending = false
  end

  def insert(word)
    curr = self
    i = 0

    while i < word.length
      letter = word[i]

      curr.children[letter] = Trie.new unless curr.children[letter]
      s = curr.children[letter].suggestions
      s << word if s.length < 3
      curr = curr.children[letter]
      i += 1
    end
    curr.ending = true
  end
end

def suggested_products3(products, search_word)
  products.sort!
  res = []
  i = 0
  trie = Trie.new
  products.each { |p| trie.insert(p) }
  node = trie

  while i < search_word.length
    letter = search_word[i]
    s = node && node.children[letter] ? node.children[letter].suggestions : []

    res << s
    node = node && node.children[letter] ? node.children[letter] : nil
    i += 1
  end

  res
end
