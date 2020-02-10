def depth_sum(nested_list, depth = 1)
  sum = 0

  nested_list.each do |ni|
    sum += if ni.is_integer
             ni.get_integer * depth
           else
             depth_sum(ni.get_list, depth + 1) # for list, reset sum to 0
           end
  end

  sum
end

# helper method
def depth_sum2(nested_list)
  sum_helper(nested_list, 1)
end

def sum_helper(list, depth)
  sum = 0
  list.each do |ni|
    sum += if ni.is_integer
             ni.get_integer * depth
           else
             sum_helper(ni.get_list, depth + 1)
           end
  end

  sum
end
