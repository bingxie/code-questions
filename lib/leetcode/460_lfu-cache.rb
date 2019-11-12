class Node
  attr_accessor :key, :value, :prev, :next

  def initialize(key = nil, value = nil)
    @key = key
    @value = value

    @prev = nil
    @next = nil
  end
end

class DoubleLinkedList
  attr_accessor :head, :tail
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  # always add to head
  def add_node(node)
    node.prev = head
    node.next = head.next

    head.next.prev = node
    head.next = node
  end

  def remove_node(node)
    node_prev = node.prev
    node_next = node.next

    node_prev.next = node_next
    node_next.prev = node_prev

    node
  end

  def move_to_head(node)
    remove_node(node)
    add_node(node)
  end
end

class LFUCache
  def initialize(capacity)
    @capacity = capacity
    @cache = {}
    @list = DoubleLinkedList.new
    @lfu = Hash.new(0)
  end

  def get(key)
    node = @cache[key]

    return -1 if node.nil?

    @list.move_to_head(node)
    increase_freq(key)

    node.value
  end

  def put(key, value)

    node = @cache[key]
    return nil if @capacity == 0

    if node.nil? && @cache.size == @capacity
      lfu_key = @lfu.min_by{ |k, v| v}.first

      @lfu.delete(lfu_key)
      evict_node = @cache.delete(lfu_key)
      @list.remove_node(evict_node)
    end

    increase_freq(key)

    if node.nil?
      node = Node.new(key, value)
      puts "new key: #{key}"
      @cache[key] = node
      @list.add_node(node)
    else
      node.value = value       # update the value
      @list.move_to_head(node)
      puts "update key: #{key}"
    end
  end

  def increase_freq(key)
    freq = @lfu[key]
    @lfu.delete(key)
    @lfu[key] = freq + 1  # 也需要重新插入保持顺序
  end

  def inspect
    "cache: #{@cache.keys}, lfu: #{@lfu}"
  end
end

cache = LFUCache.new(2)

cache.put(2, 1)
p cache

cache.put(1, 1)
p cache

cache.put(2, 3)
p cache

cache.put(4, 1)
p cache

p cache.get(1)
p cache

p cache.get(2)
p cache
