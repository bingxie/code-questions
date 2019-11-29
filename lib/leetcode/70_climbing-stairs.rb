# @param {Integer} n
# @return {Integer}
def climb_stairs(n, memo = [])
  return 1 if n == 1
  return 2 if n == 2
  return memo[n] if memo[n]

  result = climb_stairs(n - 2, memo) + climb_stairs(n - 1, memo)
  memo[n] = result

  result
end

# bottom-up
def climb_stairs2(n)
  return 1 if n == 1

  dp = []

  dp[1] = 1
  dp[2] = 2

  (3..n).each { |i| dp[i] = dp[i - 1] + dp[i - 2] }

  dp[n]
end

p climb_stairs2(3)
