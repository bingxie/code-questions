module Algorithms
  module BinarySearch
    def self.search(sorted_array, target)
      raise 'sorted_array can not be nil' if sorted_array.nil?

      floor_index = 0
      ceiling_index = sorted_array.length - 1

      while floor_index <= ceiling_index  # be careful: floor_index == ceiling index
        # guess_index = (ceiling_index + floor_index) / 2

        # find the index ~halfway between the floor and ceiling
        # And also avoid floor_index + ceiling_index could be too big
        guess_index = floor_index + (ceiling_index - floor_index) / 2
        guess_value = sorted_array[guess_index]

        return guess_index if guess_value == target

        if guess_value < target
          floor_index = guess_index + 1
        else
          ceiling_index = guess_index - 1
        end
      end
    end
  end
end

sorted_array = [1,2,3]
puts Algorithms::BinarySearch.search(sorted_array, 2)
sorted_array = [1,2,3,4]
puts Algorithms::BinarySearch.search(sorted_array, 2)
puts Algorithms::BinarySearch.search(sorted_array, 1)
puts Algorithms::BinarySearch.search(sorted_array, 4)

# edge case
sorted_array = [2]
puts Algorithms::BinarySearch.search(sorted_array, 2)


