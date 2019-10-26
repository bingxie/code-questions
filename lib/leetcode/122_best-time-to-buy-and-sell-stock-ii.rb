# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  i = 0
  valley = prices[0]
  peak = prices[0]
  max_profit = 0

  while i < prices.size - 1
    while ( i < prices.size - 1 && prices[i] >= prices[i + 1])
      i += 1
    end
    valley = prices[i]

    while ( i < prices.size - 1 && prices[i] <= prices[i + 1])
      i += 1
    end
    peak = prices[i]

    max_profit += peak - valley
  end

  max_profit
end

p max_profit([7,1,5,3,6,4]) # 7
p max_profit([1,2,3,4,5]) # 4
p max_profit([7,6,4,3,1]) # 0


def max_profit2(prices)
  i = 0
  j = i + 1
  total = 0
  while j < prices.length
    if prices[i] >= prices[j]
      i += 1
      j += 1
    elsif prices[j+1] && prices[j] <= prices[j+1]  # 后面持续上涨
      j += 1
    else # 停止上涨
      total += (prices[j] - prices[i])
      i = j + 1
      j += 2
    end
  end

  total
end

p max_profit2([7,1,5,3,6,4]) # 7
p max_profit2([1,2,3,4,5]) # 4
p max_profit2([7,6,4,3,1]) # 0


def max_profit3(prices)
  max_profit = 0

  1.upto(prices.length - 1) do |i|
    if prices[i] > prices[i - 1]
      max_profit += prices[i] - prices[i - 1]
    end
  end

  max_profit
end

p max_profit3([7,1,5,3,6,4]) # 7
p max_profit3([1,2,3,4,5]) # 4
p max_profit3([7,6,4,3,1]) # 0
