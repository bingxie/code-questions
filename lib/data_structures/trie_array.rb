class Node
  attr_reader   :value, :children
  attr_accessor :ending
  def initialize(value)
    @value = value
    @ending  = false
    @children  = []
  end

  def inspect
    @value
  end
end

class Trie
  attr_reader :root
  def initialize
    @root = Node.new("*")
  end

  def add_word(word)
    base = @root

    word.each_char do |letter|
      children = base.children
      char_node = children.find { |node| node.value == char }
      if char_node
        base = char_node
      else
        new_node = Node.new(char)
        children.push(new_node)
        base = new_node
      end
    end
    base.ending = true
  end

  def include_word?(word)
    letters = word.chars
    base = @root

    word_found = letters.all? do |letter|
      children = base.children
      base = children.find {|node| node.value == letter}
    end

    word_found && base.ending
  end

  def find_prefix(word)
    letters = word.chars
    base = @root

    word_found = letters.all? do |letter|
      children = base.children
      base = children.find {|node| node.value == letter}
    end

    base
  end

  def find_words_starting_with(prefix)
    stack = []
    words = []
    prefix_stack = []

    stack << find_prefix(prefix)
    prefix_stack << prefix.chars.take(prefix.length() - 1)

    until stack.empty?

      node = stack.pop
      if node == :guard_node
        prefix_stack.pop
        next
      end
      prefix_stack << node.value
      stack        << :guard_node  # 占位符
      words << prefix_stack.join if node.ending
      node.children.each { |n| stack << n }
      p "stack: #{stack}"
      p "prefix_stack: #{prefix_stack}"
      p "-----------------------------------"
    end

    words
  end
end


trie = Trie.new
trie.add_word("abc")
trie.add_word("abd")

p trie.find_words_starting_with("ab")
