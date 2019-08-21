require_relative '../libs/assert_equal'
require 'set'

extend AssertEqual

def find_best_routes(max_dist, forward_list, return_list)
  sorted_forward_list = sort_forward_list(forward_list)
  results = []
  largest_sum = 0

  return_list.each do |r_item|
    sorted_forward_list.each do |f_item|
      temp_sum = r_item[1] + f_item[1]

      if temp_sum <= max_dist
        if temp_sum == largest_sum
          results << [f_item[0], r_item[0]]
        elsif temp_sum > largest_sum
          results.clear
          largest_sum = temp_sum
          results << [f_item[0], r_item[0]]
        end
      else
        break
      end
    end
  end
  results
end

def sort_forward_list(forward_list)
  forward_list.sort { |a, b| a[1] <=> b[1] }
end

def run_tests
  desc = 'two pairs of results'
  forward_list = [[1,3], [2,5], [3,7], [4,10]]
  return_list = [[1,2], [2,3], [3,4], [4,5]]

  result = find_best_routes(10, forward_list, return_list)
  assert_equal(result, [[3,2], [2,4]], desc)

  desc = 'one result'
  forward_list = [[1,3], [2,5], [3,7], [4,10]]
  return_list = [[1,2], [2,3], [3,4], [4,5]]

  result = find_best_routes(11, forward_list, return_list)
  assert_equal(result, [[3,3]], desc)

  desc = 'short flight'
  forward_list = [[1,2], [2,4]]
  return_list = [[1,1]]

  result = find_best_routes(4, forward_list, return_list)
  assert_equal(result, [[1,1]], desc)
end

run_tests