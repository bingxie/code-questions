def get_max_profit(stock_prices)
  raise ArgumentError, 'requires as least two prices' if stock_prices.length < 2

  min_price = stock_prices[0]
  max_profit = stock_prices[1] - stock_prices[0]

  stock_prices[1..stock_prices.length].each do |current_price|
    potential_profit = current_price - min_price

    max_profit = [potential_profit, max_profit].max

    min_price = [current_price, min_price].min
  end

  max_profit
end

# tests

def run_tests
  desc = 'price goes up then down'
  actual = get_max_profit([1, 5, 3, 2])
  expected = 4
  assert_equal(actual, expected, desc)

  desc = 'price goes down then up'
  actual = get_max_profit([7, 2, 8, 9])
  expected = 7
  assert_equal(actual, expected, desc)

  desc = 'price goes up all day'
  actual = get_max_profit([1, 6, 7, 9])
  expected = 8
  assert_equal(actual, expected, desc)

  desc = 'price goes down all day'
  actual = get_max_profit([9, 7, 4, 1])
  expected = -2
  assert_equal(actual, expected, desc)

  desc = 'price stays the same all day'
  actual = get_max_profit([1, 1, 1, 1])
  expected = 0
  assert_equal(actual, expected, desc)

  desc = 'error with empty prices'
  assert_raises(desc) {
    get_max_profit([])
  }

  desc = 'error with one price'
  assert_raises(desc) {
    get_max_profit([1])
  }
end

def assert_equal(a, b, desc)
  if a == b
    puts "#{desc} ... PASS"
  else
    puts "#{desc} ... FAIL: #{a} != #{b}"
  end
end

def assert_raises(desc)
  begin
    yield
    puts "#{desc} ... FAIL"
  rescue
    puts "#{desc} ... PASS"
  end
end

run_tests()
