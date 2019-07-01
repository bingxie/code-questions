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
    -(distance <=> point.distance)
  end

  def to_array
    [@x, @y]
  end
end
# @param {Integer[][]} points
# @param {Integer} k
# @return {Integer[][]}
def k_closest(points, k)
  pq = PriorityQueue.new

  points.each do |p|
    point = Point.new(p[0], p[1])

    pq.push(point)
  end

  results = []

  k.times do
    results << pq.pop.to_array
  end
  results
end

pp k_closest([[1,3], [-2,2]], 1) # [-2,2]

pp k_closest([[3,3],[5,-1],[-2,4]], 2) # [[3,3],[-2,4]]

