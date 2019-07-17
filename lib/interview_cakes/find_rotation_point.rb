module FindRotationPoint
  def self.call(words)
    first_word = words.first  # 找到比较的对象非常重要, 然后用类似这般查找的方法

    floor_index = 0
    ceiling_index = words.length - 1

    while floor_index < ceiling_index
      guess_point = floor_index + (ceiling_index - floor_index) / 2

      if words[guess_point] >= first_word # 注意 =，也就是 guess_point 跑到最前面的情况
        floor_index = guess_point
      else
        ceiling_index = guess_point
      end

      # return if floor and ceiling have converged
      # between floor and ceiling is where we flipped to the beginning
      # so ceiling is alphabetically first
      return ceiling_index if floor_index + 1 == ceiling_index
    end
  end
end


def find_rotation_point(words)
  start = 0
  ceiling = words.length

  while start < ceiling
    mid = start + (ceiling - start) / 2

    if words[start] <= words[mid]
      start = mid
    else
      ceiling = mid
    end

    return ceiling if start + 1 == ceiling
  end
end

# Tests

def run_tests
  desc = 'small array'
  actual = find_rotation_point(['cape', 'cake'])
  expected = 1
  assert_equal(actual, expected, desc)

  desc = 'medium array'
  actual = find_rotation_point(['grape', 'orange', 'plum', 'radish', 'apple'])
  expected = 4
  assert_equal(actual, expected, desc)

  desc = 'large array'
  actual = find_rotation_point(['ptolemaic', 'retrograde', 'supplant',
                                'undulate', 'xenoepist', 'asymptote',
                                'babka', 'banoffee', 'engender',
                                'karpatka', 'othellolagkage'])
  expected = 5
  assert_equal(actual, expected, desc)

  # Are we missing any edge cases?
end

def assert_equal(a, b, desc)
  puts "#{desc} ... #{a == b ? 'PASS' : "FAIL: #{a.inspect} != #{b.inspect}"}"
end

run_tests
