# Tags: #Double Linked List, #Hash, #LRU #Cache
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

  # 用于保证最近使用的在最前面
  def move_to_head(node)
    remove_node(node)
    add_node(node)
  end

  # 超过capacity之后,总是从最后删除
  def pop_tail
    remove_node(tail.prev)
  end
end

class LRUCache
  def initialize(capacity)
    @capacity = capacity
    @cache = {}
    @list = DoubleLinkedList.new
  end

  def get(key)
    node = @cache[key]

    return -1 if node.nil?

    @list.move_to_head(node)

    node.value
  end

  def put(key, value)
    node = @cache[key]

    if node.nil?
      node = Node.new(key, value)

      @cache[key] = node
      @list.add_node(node)
    else
      node.value = value # update the value
      @list.move_to_head(node)
    end

    if @cache.size > @capacity
      removed_node = @list.pop_tail
      @cache.delete(removed_node.key)
    end
  end
end
