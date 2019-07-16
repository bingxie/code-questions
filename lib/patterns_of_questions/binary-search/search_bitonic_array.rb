def search_bitonic_array(arr, key)
  max_index = find_bitonic_array_max(arr)

  key_index = binary_search(arr, key, 0, max_index)

  return key_index if key_index != -1

  binary_search(arr, key, max_index + 1, arr.length - 1)  # 注意数组的边界
end

def binary_search(arr, key, floor, ceiling)
  while floor <= ceiling
    mid = floor + (ceiling - floor) / 2  # 一定要在循环内部

    return mid if arr[mid] == key  # find

    if arr[floor] < arr[ceiling] # ascending
      if key < arr[mid]
        ceiling = mid -1
      else
        floor = mid + 1
      end
    else # descending order
      if key < arr[mid]
        floor = mid + 1
      else
        ceiling = mid -1
      end
    end
  end

  -1
end

# find index of the maximum value in a bitonic array
def find_bitonic_array_max(arr)
  floor = 0
  ceiling = arr.length - 1

  while floor < ceiling do
    mid = floor + (ceiling - floor) / 2

    if arr[mid] > arr[mid + 1]
      ceiling = mid
    else
      floor = mid + 1
    end
  end

  floor
end

p search_bitonic_array([1, 3, 8, 4, 3], 4)  # 3
p search_bitonic_array([3, 8, 3, 1], 8)  # 1
p search_bitonic_array([1, 3, 8, 12], 12)  # 3
p search_bitonic_array([10, 9, 8], 10)  # 0