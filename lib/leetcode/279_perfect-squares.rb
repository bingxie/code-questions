# @param {Integer} n
# @return {Integer}

# Recurision + Cache
@min_to_num = { 0 => 0 }

@squares = []

def get_all_perfect_squares(n)
  i = 1
  while i * i <= n
    @squares << (i * i)
    @min_to_num[i * i] = 1
    i += 1
  end
end

def min_num_squares(n)
  return @min_to_num[n] if @min_to_num.key?(n)

  mins = []

  @squares.each do |square|
    break if square > n

    mins << (n / square) + min_num_squares(n % square)
  end

  @min_to_num[n] = mins.min
  @min_to_num[n]
end

def num_squares(n)
  @squares = []
  get_all_perfect_squares(n)

  min_num_squares(n)
end

puts num_squares(12) # 3
puts num_squares(13) # 2

# 递归 + memo的方法, 从n到1
def num_squares2(n)
  min_num_squares2(n)
end

def min_num_squares2(n, memo = {})
  return 0 if n.zero?

  return memo[n] if memo[n]

  mins = []

  (1..Math.sqrt(n)).each do |i| # 计算square可以采用前一种方法,进行缓存, 然后break循环
    square = i * i
    mins << (n / square) + min_num_squares2(n % square, memo)
  end

  memo[n] = mins.min
end

puts num_squares2(12)
puts num_squares2(13)

# Dynamic Programming, 从 1 - n
def num_squares3(n)
  dp = Array.new(n + 1, n)

  dp[0] = 0
  dp[1] = 1

  (1..n).each do |i|
    (1..Math.sqrt(i)).each do |j|   #可以缓存或者优化all perfect squares的计算和遍历
      square = j * j
      dp[i] = [dp[i], dp[i - square] + 1].min
    end
  end

  dp[n]
end

puts num_squares3(12)
puts num_squares3(13)
