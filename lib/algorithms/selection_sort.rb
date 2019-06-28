def selection_sort(arr)
  n = arr.length - 1
  n.times do |i|
    min_index = i
    (i + 1).upto(n) do |j|
      min_index = j if arr[j] < arr[min_index]
    end
    arr[i], arr[min_index] = arr[min_index], arr[i] if min_index != i
  end
  arr
end

arr = [2, 5, 6, 2, 5425, 54, 5, 4, 12, 7, 3, 5, 5]
pp selection_sort(arr)