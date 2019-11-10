# @param {Integer[]} prices
# @param {Integer} fee
# @return {Integer}
def max_profit(prices, fee)
  p_buy = 0
  p_sell = 1
  max_profit = 0

  while p_sell < prices.size
    if prices[p_buy] >= prices[p_sell]
      p_buy += 1
      p_sell += 1
    elsif prices[p_sell + 1] && prices[p_sell + 1] >= prices[p_sell]
      p_sell += 1
    else
      profit = prices[p_sell] - prices[p_buy]

      if profit > fee
        max_profit += profit - fee
        p_buy = p_sell + 1
        p_sell = p_buy + 1
      else
        p_sell += 1
      end
    end
  end

  max_profit
end

prices = [1, 3, 2, 8, 4, 9]
fee = 2

p max_profit(prices, fee)  # 8
