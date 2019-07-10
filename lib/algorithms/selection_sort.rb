def selection_sort(arr)
  n = arr.length - 1
  n.times do |i|
    min_index = i
    (i + 1).upto(n) do |j|
      min_index = j if arr[j] < arr[min_index]
    end
    arr[i], arr[min_index] = arr[min_index], arr[i] if min_index != i
    p arr
  end
  arr
end

arr = [3,2,8,5,7,6]
pp selection_sort(arr)