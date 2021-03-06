# 参考： https://leetcode.com/problems/remove-invalid-parentheses/discuss/75027/easy-short-concise-and-fast-java-dfs-3-ms-solution

# @param {String} s
# @return {String[]}
def remove_invalid_parentheses(s)
  @results = []

  remove(s, 0, 0, ['(', ')'])

  @results
end

def remove(s, prev_i, prev_j, par)
  counter = 0

  (prev_i...s.length).each do |i|
    counter += 1 if s[i] == par[0]
    counter -= 1 if s[i] == par[1]

    next if counter >= 0

    (prev_j..i).each do |j|
      remove(s[0...j] + s[(j + 1)..-1], i, j, par) if s[j] == par[1] && (s[j - 1] != par[1] || j == prev_j)
    end

    return
  end
  p "s: #{s}"
  r_s = s.reverse
  if par[0] == '('
    remove(r_s, 0, 0, [')', '('])
  else
    @results << r_s
  end
end

s = '(()(()'
p remove_invalid_parentheses(s)

s = '()())()'
# p remove_invalid_parentheses(s)
