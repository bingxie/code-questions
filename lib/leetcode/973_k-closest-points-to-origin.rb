require_relative '../data_structures/queues/priority_queue.rb'

class Point
  include Comparable

  def initialize(x, y)
    @x = x
    @y = y
  end

  def distance
    @x**2 + @y**2
  end

  def <=>(point)
    distance <=> point.distance
  end

  def to_array
    [@x, @y]
  end
end

# Time complexity: O(n + (n-k)log(k))
# Space complexity : O(K)

# @param {Integer[][]} points
# @param {Integer} k
# @return {Integer[][]}
def k_closest(points, k)
  pq = PriorityQueue.new  #max heap

  points[0..k-1].each do |p|              # O(k)
    point = Point.new(p[0], p[1])

    pq.push(point)
  end

  points[k..points.size-1].each do |p|  #(n-k loop)
    point = Point.new(p[0], p[1])
    if point.distance < pq.peek.distance
      pq.pop
      pq.push(point)                    # O(log(k)
    end
  end # (n-k)*O(log(k))

  results = []

  k.times do        # O(k)
    results << pq.pop.to_array
  end
  results
end

pp k_closest([[1,3], [-2,2]], 1) # [-2,2]

pp k_closest([[3,3],[5,-1],[-2,4]], 2) # [[3,3],[-2,4]]

