# @param {Integer} n
# @return {Integer[][]}
def get_factors(n)
  result = []

  factor_helper(result, [], n, 2)

  result
end

def factor_helper(result, sofar, target, start)
  if target <= 1
    result.push sofar.dup if sofar.size > 1
    return
  end

  start.upto(target) do |num|
    next unless target % num == 0

    sofar.push num
    factor_helper(result, sofar, target / num, num)
    sofar.pop
  end
end
#
# [
#   [2, 6],
#   [2, 2, 3],
#   [3, 4]
# ]
p get_factors(12)
p get_factors(25)
p get_factors(13)
p get_factors(1)
