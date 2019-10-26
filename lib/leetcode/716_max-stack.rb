class MaxStack
  def initialize
    @max_stack = []
    @items = []
  end

  def push(x)
    max = @max_stack.empty? ? x : @max_stack.last
    @max_stack.push(x > max ? x : max)
    @items.push(x)
  end

  def pop
    @max_stack.pop
    @items.pop
  end

  def top
    @items.last
  end

  def peek_max
    @max_stack.last
  end

  def pop_max
    max = peek_max

    buffer = []
    buffer.push(pop) while top != max

    pop # pop the max

    push(buffer.pop) until buffer.empty?

    max
  end
end

# Your MaxStack object will be instantiated and called as such:
stack = MaxStack.new
stack.push(5)
stack.push(1)
stack.push(5)

p stack.top # 5

p stack.pop_max # 5

p stack.top # 1
p stack.peek_max # 5

p stack.pop # 1
p stack.top # 5
