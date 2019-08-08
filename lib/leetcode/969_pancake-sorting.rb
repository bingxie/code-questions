# Array Sort
def pancake_sort(arr)
  result = []
  pointer = arr.size - 1

  while pointer > 0
    current_max = arr[0..pointer].max
    current_max_index = arr.index(current_max)

    result << current_max_index + 1

    arr = flip(arr, current_max_index)

    result << pointer + 1

    arr = flip(arr, pointer)

    pointer -= 1
  end

  result
end

def flip(arr, position)
  arr[0..position].reverse + arr[position + 1..-1]
end

p pancake_sort([3, 2, 4, 1])
