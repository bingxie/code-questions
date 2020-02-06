def int_to_roman(num)
  queue = [
    [1, 'I'],
    [4, 'IV'],
    [5, 'V'],
    [9, 'IX'],
    [10, 'X'],
    [40, 'XL'],
    [50, 'L'],
    [90, 'XC'],
    [100, 'C'],
    [400, 'CD'],
    [500, 'D'],
    [900, 'CM'],
    [1000, 'M']
  ]

  res = ''

  while num > 0
    tmp_num, roman = queue.last

    return res + roman if num == tmp_num

    if num > tmp_num
      num -= tmp_num
      res += roman
    else
      queue.pop
    end
  end

  res
end

# @param {Integer} num
# @return {String}
def int_to_roman2(num)
  res = ''
  mapping = { 'I' => 1, 'IV' => 4, 'V' => 5, 'IX' => 9, 'X' => 10,
              'XL' => 40, 'L' => 50, 'XC' => 90, 'C' => 100, 'CD' => 400,
              'D' => 500, 'CM' => 900, 'M' => 1000 }

  mapping.keys.reverse_each do |v|
    while num - mapping[v] >= 0
      num -= mapping[v]
      res += v
    end
  end
  res
end

p int_to_roman(1994) # "MCMXCIV"
p int_to_roman2(1994) # "MCMXCIV"
