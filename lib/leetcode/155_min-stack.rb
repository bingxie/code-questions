class MinStack
  def initialize
      @mins, @stack = [], []
  end

  def push(x)
      @stack.push x
      @mins.push x if @mins.empty? or x <= @mins.last
      pp @stack
      pp @mins
  end

  def pop
      @mins.pop if @stack.pop == @mins.last
  end

  def top
      @stack.last
  end

  def get_min
      @mins.last
  end
end

minStack = MinStack.new;
minStack.push(-4);
minStack.push(-2);
minStack.push(-3);
minStack.push(0);

# pp minStack.get_min(); # -3
# pp minStack.pop(); # 0
# pp minStack.top(); # -2
# pp minStack.get_min(); # -3