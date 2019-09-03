class Deque
  def initialize
    @head = nil
    @tail = nil
  end

  def push(value)
    if @tail
      @tail = @tail.append(value)
    else
      @head = @tail = Node.new(value)
    end
  end

  def pop
    return nil if @tail.nil?

    value = @tail.value
    @tail = @tail.prev
    @tail.next = nil if @tail
    value
  end

  def unshift(value)
    @head = if @head
              @head.prepend(value)
            else
              @tail = Node.new(value)
            end
  end

  def shift
    return nil if @head.nil?

    value = @head.value
    @head = @head.next
    @head.prev = nil if @head

    value
  end

  def first
    @head ? @head.value : nil
  end

  def last
    @tail ? @tail.value : nil
  end

  def empty?
    @head.nil?
  end

  private

  Node = Struct.new(:value, :prev, :next) do
    def prepend(value)
      raise 'Can not prepend here' if prev

      self.prev = self.class.new(value, nil, self)
    end

    def append(value)
      raise 'Can not append here' if self.next

      self.next = self.class.new(value, self, nil)
    end
  end
end

deque = Deque.new
deque.push('1')
deque.push('2')

p deque.pop

deque.unshift('3')
p deque.shift

deque.push('4')
deque.unshift('5')
p deque.first
p deque.last

p deque.empty?

p deque.pop
p deque.pop
p deque.shift

p deque.empty?
# pp deque

p deque.unshift('6')
p deque.pop

p deque.empty?
