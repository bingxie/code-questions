# 主要就是测试recursion的理解
def deep_diff(a, b)
  (a.keys | b.keys).each_with_object({}) do |k, diff|
    next unless a[k] != b[k]

    diff[k] = if a[k].is_a?(Hash) && b[k].is_a?(Hash)
                deep_diff(a[k], b[k])
              else
                [a[k], b[k]]
              end
    # diff
  end
end

def deep_diff2(a, b)
  (a.keys | b.keys).each_with_object({}) do |key, diff|
    next unless a[key] != b[key]

    diff[key] = if a[key].is_a?(Hash) && b[key].is_a?(Hash)
                  deep_diff2(a[key], b[key])
                else
                  [a[key], b[key]]
                end
  end
end

a = { 'one' => 1, 'two' => 2 }
b = { 'two' => 2, 'one' => 1 }

p deep_diff(a, b)

a = {
  'one' => '1',
  'diff' => 'a',
  'only a' => 'a',
  'nested' => {
    'x' => 'x',
    'y' => {
      'a' => 'a',
      'diff' => 'a'
    }
  }
}

b = {
  'one' => '1',
  'diff' => 'b',
  'only b' => 'b',
  'nested' => {
    'x' => 'x',
    'y' => {
      'a' => 'a',
      'diff' => 'b'
    }
  }
}

pp deep_diff(a, b)

a = {
  apple: 3,
  orange: {
    banana: 4,
    strawberry: 7
  },
  bluebeery: 5,
  grape: {
    peer: 3
  }
}

b = {
  apple: 3,
  orange: {
    banana: 3,
    strawberry: 7,
    orange: 6
  },
  bluebeery: 8,
  grape: 3
}

p deep_diff(a, b)
p deep_diff2(a, b)
