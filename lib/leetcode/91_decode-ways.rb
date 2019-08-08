# @param {String} s
# @return {Integer}
def num_decodings(str)  # 递归 + memorization
  cache = {}
  get_result(str, 0, cache)
end

def get_result(str, start, cache)
  return 1 if start == str.length

  return 0 if str[start] == '0'

  return cache[start] if cache[start]

  result1 = get_result(str, start + 1, cache)
  result2 = 0

  if start < str.length - 1
    if "#{str[start]}#{str[start + 1]}".to_i <= 26
      result2 = get_result(str, start + 2, cache)
    end
  end

  cache[start] = result1 + result2
  return result1 + result2
end

p num_decodings("226")


# 采用动态规划

def num_decodings2(str)
  length = str.length
  return 1 if length == 1 && str != '0'

  dp = Array.new(length+1, 0)

  dp[length] = 1

  dp[length - 1] = 1 if str[length -1] != '0'

  (length - 2).downto(0) do |i|
    next if str[i] == '0'

    result1 = dp[i + 1]

    number = "#{str[i]}#{str[i + 1]}".to_i
    if number <= 26
      result2 = dp[i + 2]
    end
    dp[i] = result1.to_i + result2.to_i
  end
  return dp[0]
end

p num_decodings2("10")
p num_decodings2("226")
p num_decodings2("27")