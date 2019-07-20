class TrieNode < Hash
  attr_accessor :is_end
  def initialize(is_end = false)
    super
    @is_end = is_end
  end
end

class Trie
  attr_reader :root
  def initialize
    @root = TrieNode.new
  end

  def insert(word)
    current = root
    word.each_char do |char|
      current = (current[char] ||= TrieNode.new)
    end
    current.is_end = true
  end

  def search(word)
    current = root
    found = word.chars.all? do |char|
      current = current[char]
    end
    found && current.is_end
  end

  def starts_with(prefix)
    current = root
    prefix.chars.all? do |char|
      current = current[char]
    end
  end

  def search_reg(word)
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

trie = Trie.new
trie.insert('dogs')
trie.insert('doas')
trie.insert('doac')

p trie.search('dogs')
p trie.starts_with('doa')

p trie.search_reg('do.s')