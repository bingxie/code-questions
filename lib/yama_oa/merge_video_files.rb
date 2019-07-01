require_relative '../data_structures/queues/heap.rb'

def optimal_file_merge(file_sizes)
  pq = Heap.new(:min)

  file_sizes.each { |size| pq.push size }

  count = 0

  while pq.size > 1
    temp_count = pq.pop + pq.pop
    count += temp_count

    pq.push temp_count
  end

  count
end

pp optimal_file_merge([2, 3, 4, 5, 6, 7])  #68
pp optimal_file_merge([8, 4, 6, 12])  #58
pp optimal_file_merge([20, 4, 8, 2])  #54
pp optimal_file_merge([1, 2, 5, 10, 35, 89])  #224
pp optimal_file_merge([20])  #0