require_relative '../libs/assert_equal'

require 'set'

extend AssertEqual


# Determine if two movie runtimes add up to the flight length
def can_two_movies_fill_flight?(movie_lengths, flight_length)
  movie_lengths_seen = Set.new

  longest_pair = nil

  movie_lengths.each do |first_movie_length|
    matching_second_movie_length = flight_length - first_movie_length

    if movie_lengths_seen.include?(matching_second_movie_length)

      current_pair = [matching_second_movie_length, first_movie_length]
      if longest_pair
        pre_longest = longest_pair.max
        current_longest = current_pair.max

        if current_longest > pre_longest
          longest_pair = current_pair
        end
      else
        longest_pair = current_pair
      end
    else
      movie_lengths_seen.add(first_movie_length)
    end
  end

  longest_pair
end


# Tests

def run_tests
  desc = 'short flight'
  result = can_two_movies_fill_flight?([2, 4], 1)
  assert_equal(result, nil, desc)

  desc = 'long flight'
  result = can_two_movies_fill_flight?([2, 4], 6)
  assert_equal(result, [2, 4], desc)

  desc = 'one movie half flight length'
  result = can_two_movies_fill_flight?([3, 8], 6)
  assert_equal(result, nil, desc)

  desc = 'two movies half flight length'
  result = can_two_movies_fill_flight?([3, 8, 3], 6)
  assert_equal(result, [3,3], desc)

  desc = 'lots of possible pairs, return the longest one'
  result = can_two_movies_fill_flight?([1, 2, 3, 4, 5, 6], 7)
  pp result
  assert_equal(result, [1, 6], desc)

  desc = 'not using first movie'
  result = can_two_movies_fill_flight?([4, 3, 2], 5)
  assert_equal(result, [3, 2], desc)

  desc = 'only one movie'
  result = can_two_movies_fill_flight?([6], 6)
  assert_equal(result, nil, desc)

  desc = 'no movies'
  result = can_two_movies_fill_flight?([], 2)
  assert_equal(result, nil, desc)
end



run_tests