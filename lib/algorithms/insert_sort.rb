# https://youtu.be/i-SKeOcBwko

def insert_sort(array)
  (1...array.length).each do |index|
    hole = index
    temp_value = array[index]

    while hole > 0 && array[hole - 1] > temp_value
      array[hole] = array[hole - 1]
      hole -= 1
    end

    array[hole] = temp_value
  end
end

array = [3, 2, 7, 4, 1, 5, 6]
insert_sort(array)

p array
