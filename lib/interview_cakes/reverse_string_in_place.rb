def reverse!(string)
  return if string.length < 2
  start_index = 0
  end_index = string.length - 1

  while start_index < end_index
    string[start_index], string[end_index] = string[end_index], string[start_index]

    start_index += 1
    end_index -= 1
  end
end

def run_tests
  desc = 'empty string'
  string = ''
  reverse!(string)
  expected = ''
  assert_equal(string, expected, desc)

  desc = 'single character string'
  string = 'A'
  reverse!(string)
  expected = 'A'
  assert_equal(string, expected, desc)

  desc = 'longer string'
  string = 'ABCDE'
  reverse!(string)
  expected = 'EDCBA'
  assert_equal(string, expected, desc)
end

def assert_equal(a, b, desc)
  if a == b
    puts "#{desc} ... PASS"
  else
    puts "#{desc} ... FAIL: #{a} != #{b}"
  end
end

run_tests