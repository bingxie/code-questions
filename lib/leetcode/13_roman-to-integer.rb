# @param {String} s
# @return {Integer}
def roman_to_int(s)
  map1 = { 'I': 1, 'V': 5, 'X': 10, 'L': 50, 'C': 100, 'D': 500, 'M': 1000 }
  map2 = { 'IV': 4, 'IX': 9, 'XL': 40, 'XC': 90, 'CD': 400, 'CM': 900 }

  result = 0

  input = s.dup

  until input.empty?
    # map2必须在map1的前面
    map2.merge(map1).each do |key, value|
      next unless input.start_with?(key.to_s)

      result += value
      input = input[key.size..-1]
      break
    end
  end

  result
end

p roman_to_int('III')
p roman_to_int('IV')
p roman_to_int('IX')
p roman_to_int('LVIII')
p roman_to_int('MCMXCIV')

# 很巧妙的方法，用减法处理，4，9等
def roman_to_int2(s)
  conversion = {
    'I' => 1, 'V' => 5, 'X' => 10,
    'L' => 50, 'C' => 100, 'D' => 500,
    'M' => 1000
  }
  result = 0

  (1...s.length).each do |i|
    if conversion[s[i - 1]] < conversion[s[i]]
      result -= conversion[s[i - 1]]
    else
      result += conversion[s[i - 1]]
    end
  end

  result += conversion[s[-1]]
end

p roman_to_int2('MCMXCIV')
