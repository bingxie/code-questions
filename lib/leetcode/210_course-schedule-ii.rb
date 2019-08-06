require 'set'

class Graph
  attr_accessor :nodes

  def initialize(num_courses)
    @nodes = {}
    @visited = Set.new

    @num_courses = num_courses
    @top_order = []

    @in_degrees = Hash.new(0)
  end

  # edge: [0, 1]
  def add_edge(edge)
    @nodes[edge.first] ||= Set.new
    @nodes[edge.first] << edge.last

    @in_degrees[edge.last] += 1
  end

  # BFS tweaked topological sort
  def find_order_bfs
    queue = []
    @num_courses.times { |v| queue.push(v) if @in_degrees[v].zero? }  # 入度为0的全都放入

    visited = []
    until queue.empty?
      node_key = queue.shift

      visited.unshift(node_key)  # 注意顺序

      @nodes[node_key]&.each do |neighbor|
        @in_degrees[neighbor] -= 1
        queue.push(neighbor) if @in_degrees[neighbor].zero?
      end
    end

    visited.size == @num_courses ? visited : []
  end

  def topological_order
    has_cycle? ? [] : @top_order
  end

  def has_cycle?
    @num_courses.times do |node_key|
      return true if !@visited.include?(node_key) && dfs_cycle?(node_key)
    end
    false
  end

  def dfs_cycle?(node_key, visting = Set.new)
    @visited << node_key  # Keep track of nodes visited globally
    visting << node_key  # Keep track of nodes visited as far as a path goes

    @nodes[node_key]&.each do |neighbor|
      return true if !@visited.include?(neighbor) && dfs_cycle?(neighbor, visting)

      return true if visting.include?(neighbor)
    end

    visting.delete(node_key)
    @top_order.push node_key
    false
  end
end

def find_order(num_courses, prerequisites)
  g = Graph.new(num_courses)

  prerequisites.each { |p| g.add_edge(p) }

  g.topological_order
end

g = Graph.new(4)
[[3, 2], [3, 1], [1, 0], [2, 0]].each { |p| g.add_edge(p) }

p g.find_order_bfs
p g.topological_order
