def is_rotation(arr_a, arr_b)
  return false if arr_a.size != arr_b.size

  key = arr_a[0]
  key_b = -1

  arr_b.each_with_index do |item, index|
    if item == key
      key_b = index
      break
    end
  end

  return false if key_b == -1

  arr_a.each_with_index do |item, index|
    j = (key_b + index) % arr_a.size          # 这个找相对index的技巧很重要
    return false if item != arr_b[j]
  end

  true
end

arr_a = [1, 2, 3, 4, 5, 6, 7]
arr_b = [4, 5, 6, 7, 1, 2, 3]

p is_rotation(arr_a, arr_b)

p is_rotation([1, 2, 3], [1, 2, 2])