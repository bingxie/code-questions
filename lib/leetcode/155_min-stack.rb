class MinStack2
  def initialize
    @stack = []
    @min_stack = []
  end

  def push(x)
    @stack.push x

    prev_min = get_min
    if prev_min.nil? || x < prev_min
      @min_stack.push x
    else
      @min_stack.push prev_min
    end
    # 这种方法比较容易理解，min_stack会存所有的values， 有一些浪费
    # 下面另外的方法，就是存跟当前值对应的最小值，只有对应的最小值pop出去后，min_stack才需要变化
  end

  def pop
    @min_stack.pop
    @stack.pop
  end

  def top
    @stack.last
  end

  def get_min
    @min_stack.last
  end
end

class MinStack
  def initialize
    @mins = []
    @stack = []
  end

  def push(x)
    @stack.push x
    @mins.push x if @mins.empty? || (x <= @mins.last)
  end

  def pop
    value = @stack.pop
    @mins.pop if value == @mins.last
  end

  def top
    @stack.last
  end

  def get_min
    @mins.last
  end
end

min_stack = MinStack2.new
min_stack.push(-3)
min_stack.push(-2)
min_stack.push(0)

pp min_stack.get_min; # -3
pp min_stack.pop; # 0
pp min_stack.top; # -2
pp min_stack.get_min; # -3
