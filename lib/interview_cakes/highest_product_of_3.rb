# Calculate the highest product of three numbers.
def highest_product_of_3(array_of_ints); end

# tests
def run_tests
  actual = highest_product_of_3([1, 2, 3, 4])
  expected = 24
  assert_equal(actual, expected, 'short array')

  actual = highest_product_of_3([6, 1, 3, 5, 7, 8, 2])
  expected = 336
  assert_equal(actual, expected, 'longer array')

  actual = highest_product_of_3([-5, 4, 8, 2, 3])
  expected = 96
  assert_equal(actual, expected, 'array has one negative')

  actual = highest_product_of_3([-10, 1, 3, 2, -10])
  expected = 300
  assert_equal(actual, expected, 'array has two negatives')

  actual = highest_product_of_3([-5, -1, -3, -2])
  expected = -6
  assert_equal(actual, expected, 'array is all negatives')

  assert_raises('empty array raises error') do
    highest_product_of_3([])
  end

  assert_raises('one number raises error') do
    highest_product_of_3([1])
  end

  assert_raises('two numbers raises error') do
    highest_product_of_3([1, 1])
  end
end

def assert_equal(a, b, desc)
  if a == b
    puts "#{desc} ... PASS"
  else
    puts "#{desc} ... FAIL: #{a} != #{b}"
  end
end

def assert_raises(desc)
  yield
  puts "#{desc} ... FAIL"
rescue StandardError
  puts "#{desc} ... PASS"
end

run_tests
