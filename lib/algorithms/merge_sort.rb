def merge_sort(array_to_sort)   # recursion

  # BASE CASE: arrays with fewer than 2 elements are sorted
  if array_to_sort.length < 2
    return array_to_sort
  end

  # STEP 1: divide the array in half
  # we use integer division, so we'll never get a "half index"
  mid_index = array_to_sort.length / 2

  left  = array_to_sort[0...mid_index]
  right = array_to_sort[mid_index..-1]

  # STEP 2: sort each half
  sorted_left  = merge_sort(left)
  sorted_right = merge_sort(right)

  # STEP 3: merge the sorted halves
  sorted_array = []

  until sorted_left.empty? && sorted_right.empty? do
    # sorted_left's first element comes next
    # if it's less than sorted_right's first
    # element or if sorted_right is empty
    # 经典的merge 两个sorted array的算法
    if !sorted_left.empty? && (sorted_right.empty? \
        || sorted_left[0] < sorted_right[0])
      sorted_array << sorted_left.shift
    else
      sorted_array << sorted_right.shift
    end
  end

  p "sorted_array: #{sorted_array}"
  sorted_array
end

new_array = [3, 23, 38, 33, 55, 12, 8]
p merge_sort(new_array)
