# @param {Integer} x
# @return {Integer}
def reverse(x)
  num = x.abs.to_s.reverse.to_i

  return 0 if num > 2 ** 31 - 1

  x.negative? ? -1 * num : num
end


# @param {Integer} x
# @return {Integer}
def reverse2(x)
  max = 2 ** 31 - 1

  num = x.abs

  rev = 0
  while num != 0
      num, pop = num.divmod 10

      rev = rev * 10 + pop
  end

  return 0 if max < rev

  x.negative? ? rev * -1 : rev
end
