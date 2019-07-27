class MovingAverage
  def initialize(size)
    @size = size
    @nums = []
    @sum = 0
  end

  def next(val)
    @nums.push val
    @sum += val

    @sum -= @nums.shift if @nums.size > @size

    @sum.to_f / @nums.size
  end
end

# Your MovingAverage object will be instantiated and called as such:
obj = MovingAverage.new(3)
p obj.next(1)
p obj.next(10)
p obj.next(3)
p obj.next(5)
