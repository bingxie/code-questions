def insert_sort(array)
  (1...array.length).each do |index|
    position = index
    temp_value = array[index]

    while position > 0 && array[position - 1] > temp_value
      array[position] = array[position - 1]
      position -= 1
    end

    array[position] = temp_value
    p array
  end
end

array = [3, 2, 7, 4, 1, 5, 6]
insert_sort(array)

p array
