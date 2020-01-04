# @param {Integer} n
# @return {Integer}
# without memo
def fib(n)
  return n if n <= 1

  fib(n - 1) + fib(n - 2)
end

# with memo
def fib2(n, memo = [])
  return n if n <= 1

  return memo[n] if memo[n]

  memo[n] = fib(n - 1, memo) + fib(n - 2, memo)
end

# bottom-up 递推
# @param {Integer} n
# @return {Integer}
def fib(n)
  return n if n <= 1

  prev1 = 0
  prev2 = 1
  current = 0

  2.upto(n) do |i|
    current = prev1 + prev2
    prev1 = prev2
    prev2 = current
  end

  current
end
