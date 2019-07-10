class SortableArray
  attr_reader :array
  def initialize(array)
    @array = array
  end

  def quicksort!(left_index, right_index)
    #base case: the subarray has 0 or 1 elements
    if right_index - left_index <= 0
      return
    end
    pivot_position = partition!(left_index, right_index)

    quicksort!(left_index, pivot_position -1)

    quicksort!(pivot_position +1, right_index)
  end

  private
  def partition!(left_pointer, right_pointer)
    # choose the right-most element as the pivot
    pivot_position = right_pointer
    pivot = @array[pivot_position]

    # start the right pointer immediately to the left of the pivot
    right_pointer -= 1

    while true do
      while @array[left_pointer] < pivot do
        left_pointer += 1
      end

      while @array[right_pointer] > pivot do
        right_pointer -= 1
      end

      if left_pointer >= right_pointer
        break
      else
        swap(left_pointer, right_pointer)
      end
    end

    # As a final step, we swap the left pointer with the pivot itself
    swap(left_pointer, pivot_position)

    # Return the left_pointer for the sake of the quicksort method
    return left_pointer
  end

  def swap(pointer_1, pointer_2)
    temp_value = @array[pointer_1]
    @array[pointer_1] = @array[pointer_2]
    @array[pointer_2] = temp_value
  end
end

array = [0, 5, 2, 1, 6, 3]
sortable_array = SortableArray.new(array)
sortable_array.quicksort!(0, array.length-1)

p sortable_array.array