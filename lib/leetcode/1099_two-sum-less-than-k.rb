# @param {Integer[]} a
# @param {Integer} k
# @return {Integer}
def two_sum_less_than_k(a, k)
  a.sort!

  i = 0
  j = a.size - 1
  max = -1

  while i < j
    sum = a[i] + a[j]
    if sum < k
      max = [sum, max].max
      i += 1
    else
      j -= 1
    end
  end
  max
end

p two_sum_less_than_k([34, 23, 1, 24, 75, 33, 54, 8], 60) == 58
