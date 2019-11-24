def deep_diff(a, b)
  (a.keys | b.keys).each_with_object({}) do |k, diff|
    if a[k] != b[k]
      if a[k].is_a?(Hash) && b[k].is_a?(Hash)
        diff[k] = deep_diff(a[k], b[k])
      else
        diff[k] = [a[k], b[k]]
      end
    end
    # diff
  end
end

def deep_diff2(a, b)
  (a.keys | b.keys).each_with_object({}) do | key, diff |
    if a[key] != b[key]
      if a[key].is_a?(Hash) && b[key].is_a?(Hash)
        diff[key] = deep_diff2(a[key], b[key])
      else
        diff[key] = [a[key], b[key]]
      end
    end
  end
end

a = {"one" => 1, "two" => 2}
b = {"two" => 2, "one" => 1}

p deep_diff(a, b)

a = {
  "one"    => "1",
  "diff"   => "a",
  "only a" => "a",
  "nested" => {
    "x" => "x",
    "y" => {
      "a"    => "a",
      "diff" => "a"
    }
  }
}

b = {
  "one"    => "1",
  "diff"   => "b",
  "only b" => "b",
  "nested" => {
    "x" => "x",
    "y" => {
      "a" => "a",
      "diff" => "b"
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
