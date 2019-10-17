# @param {Integer[]} prices
# @return {Integer}
def max_profit(stock_prices)
  return 0 if stock_prices.length < 2

  min_price = stock_prices[0]
  # first_profit = stock_prices[1] - stock_prices[0]
  max_profit = 0

  stock_prices[1..stock_prices.length].each do |current_price|
    potential_profit = current_price - min_price

    max_profit = [potential_profit, max_profit].max

    min_price = [current_price, min_price].min
  end

  max_profit
end
