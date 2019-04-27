require_relative '../libs/assert_equal'

extend AssertEqual

# O(n) time and O(n)O(n) additional space, where nn is the number of items in the merged array.

def merge_sorted_arrays(my_array, alices_array)
  # Combine the sorted arrays into one large sorted array
  merged_array_size = my_array.size + alices_array.size
  merged_array = []

  current_index_mine = 0
  current_index_alices = 0
  current_index_merged = 0

  while current_index_merged < merged_array_size # 这个判断还可以排除掉两个数据都是空的情况
    # 如果一开始某个 array 就是空的，这种情况可以合并到其中一个提前完成的情况
    is_my_array_exhausted = current_index_mine >= my_array.length
    is_alices_array_exhausted = current_index_alices >= alices_array.length

    my_next_value = my_array[current_index_mine]
    alices_next_value = alices_array[current_index_alices]

    # case: my item is next
    if !is_my_array_exhausted && (is_alices_array_exhausted || my_next_value < alices_next_value)
      merged_array << my_next_value
      current_index_mine += 1

    # case: alice's item is next
    else
      merged_array << alices_next_value
      current_index_alices += 1
    end

    current_index_merged += 1
  end

  merged_array
end

# Tests

def run_tests
  desc = 'both arrays are empty'
  actual = merge_arrays([], [])
  expected = []
  assert_equal(actual, expected, desc)

  desc = 'first array is empty'
  actual = merge_arrays([], [1, 2, 3])
  expected = [1, 2, 3]
  assert_equal(actual, expected, desc)

  desc = 'second array is empty'
  actual = merge_arrays([5, 6, 7], [])
  expected = [5, 6, 7]
  assert_equal(actual, expected, desc)

  desc = 'both arrays have some numbers'
  actual = merge_arrays([2, 4, 6], [1, 3, 7])
  expected = [1, 2, 3, 4, 6, 7]
  assert_equal(actual, expected, desc)

  desc = 'arrays are different lengths'
  actual = merge_arrays([2, 4, 6, 8], [1, 7])
  expected = [1, 2, 4, 6, 7, 8]
  assert_equal(actual, expected, desc)
end

run_tests
