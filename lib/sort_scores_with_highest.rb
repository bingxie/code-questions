# Sort the scores in O(n) time
def sort_scores(unsorted_scores, highest_possible_score)
  score_counts = Array.new(highest_possible_score + 1, 0) # 指定 Array 的 size 和默认值

  unsorted_scores.each do |score|
    score_counts[score] += 1
  end

  sorted_scores = []

  highest_possible_score.downto(0).each do |score| # #downto method
    count = score_counts[score]

    count.times { sorted_scores << score }
  end

  sorted_scores
end

def run_tests
  desc = 'no scores'
  actual = sort_scores([], 100)
  expected = []
  assert_equal(actual, expected, desc)

  desc = 'one score'
  actual = sort_scores([55], 100)
  expected = [55]
  assert_equal(actual, expected, desc)

  desc = 'two scores'
  actual = sort_scores([30, 60], 100)
  expected = [60, 30]
  assert_equal(actual, expected, desc)

  desc = 'many scores'
  actual = sort_scores([37, 89, 41, 65, 91, 53], 100)
  expected = [91, 89, 65, 53, 41, 37]
  assert_equal(actual, expected, desc)

  desc = 'repeated scores'
  actual = sort_scores([20, 10, 30, 30, 10, 20], 100)
  expected = [30, 30, 20, 20, 10, 10]
  assert_equal(actual, expected, desc)
end

def assert_equal(a, b, desc)
  if a == b
    puts "#{desc} ... PASS"
  else
    puts "#{desc} ... FAIL: #{a} != #{b}"
  end
end

run_tests
