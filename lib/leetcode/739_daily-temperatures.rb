# 从前往后的方法
def daily_temperatures(t)
  result = Array.new(t.size, 0)

  previous_index = [0]

  t.each_with_index do |temp, idx|
    next if idx == 0

    while !previous_index.empty? && temp > t[previous_index[-1]]
      result[previous_index[-1]] = idx - previous_index[-1]
      previous_index.pop
    end
    previous_index << idx
  end
  result
end

t = [73, 74, 75, 71, 69, 72, 76, 73]
p daily_temperatures(t) # [1,1,4,2,1,1,0,0]

# 从后往前的方法
# @param {Integer[]} t
# @return {Integer[]}
def daily_temperatures(t)
  stack = []
  res = Array.new(t.size, 0)
  (0...t.size).reverse_each do |i|
    temp = t[i]
    if stack.size == 0
      res[i] = 0
    elsif temp < stack.last[0]
      res[i] = 1
    else
      while stack.size > 0 && temp >= stack.last[0]
        stack.pop
      end

      if stack.size == 0
        res[i] = 0
      else
        res[i] = stack.last[1] - i
      end
    end

    stack.push([temp, i])
  end
  res
end
