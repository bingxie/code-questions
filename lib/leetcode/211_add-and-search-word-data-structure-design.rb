class TrieNode < Hash
  attr_accessor :is_end
  def initialize()
    super
    @is_end = false
  end
end

class WordDictionary

  attr_reader :root
  def initialize
    @root = TrieNode.new
  end

  def add_word(word)
    current = root
    word.each_char do |char|
      current = (current[char] ||= TrieNode.new)
    end
    current.is_end = true
  end

  def search(word)
    nodes = [root]
    word.each_char do |char|
      pp "nodes: #{nodes}"
      if char == '.'
        children = nodes.map do |node|
          node.values
        end.flatten.compact
        nodes = children
      else
        children = nodes.map do |node|
          node[char]
        end.compact
        return false if children.empty?

        nodes = children
      end
    end
    p "in the end: #{nodes}"
    nodes.any?(&:is_end)
  end
end

trie = WordDictionary.new
trie.add_word('bad')
trie.add_word('dad')
trie.add_word('mad')

p trie.search('pad')
p trie.search('bad')
p trie.search('.ad')
p trie.search('b..')
