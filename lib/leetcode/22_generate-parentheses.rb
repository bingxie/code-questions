# Also see: https://github.com/bephrem1/backtobackswe/blob/master/Dynamic%20Programming%2C%20Recursion%2C%20%26%20Backtracking/GenerateNMatchedParenStrings/GenerateNMatchedParenStrings.java
# @param {Integer} n
# @return {String[]}
# Approach 2: Backtracking
def generate_parenthesis(n)
  result = []

  backtrack_generate_parenthesis(n, n, '', result)

  result
end

def backtrack_generate_parenthesis(left_nums, right_nums, string_in_progress, result)
  # We have used all left and right parens necessary within constraints up
  # to this point. Therefore, the answer we add will be a valid paren string.
  if left_nums == 0 && right_nums == 0
    result.push string_in_progress
    return
  end

  # At each frame of the recursion we have 2 things we can do:
  #   1.) Insert a left parenthesis
  #   2.) Insert a right parenthesis
  #   These represent all of the possibilities of paths we can take from this
  #   respective call. The path that we can take all depends on the state coming
  #   into this call.

  # Can we insert a left parenthesis? Only if we have lefts remaining to insert
  # at this point in the recursion
  backtrack_generate_parenthesis(left_nums - 1, right_nums, string_in_progress + '(', result) if left_nums > 0

  # Can we insert a right parenthesis? Only if the number of left parens needed
  #   is less than then number of right parens needed.

  #   This means that there are open left parenthesis to close OTHERWISE WE CANNOT
  #   USE A RIGHT TO CLOSE ANYTHING. We would lose balance.
  backtrack_generate_parenthesis(left_nums, right_nums - 1, string_in_progress + ')', result) if left_nums < right_nums
end

p generate_parenthesis(1)
p generate_parenthesis(2)
p generate_parenthesis(3)
