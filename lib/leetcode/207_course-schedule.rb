require 'set'

class Graph
  attr_accessor :nodes

  def initialize
    @nodes = {}
    @visited = Set.new
    @top_order = []
  end

  # edge: [1, 0]
  def add_edge(edge)
    @nodes[edge.first] ||= Set.new
    @nodes[edge.first] << edge.last
  end

  def topological_order
    has_cycle? ? [] : @top_order
  end

  def has_cycle?
    @nodes.keys.each do |node_key|
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

def can_finish(_num_courses, prerequisites)
  g = Graph.new

  prerequisites.each { |p| g.add_edge(p) }

  !g.has_cycle?
end

p can_finish(2, [[1, 0]])
p can_finish(4, [[3, 2], [3, 1], [2, 0], [1, 0]])
p can_finish(2, [[1, 0], [0, 1]])

# Ruby BFS  Topological Sort

# @param {Integer} num_courses
# @param {Integer[][]} prerequisites
# @return {Boolean}
def can_finish2(num_courses, prerequisites)
  map = {}
  degree = {}
  num_courses.times do |course|
    degree[course] = 0
  end

  prerequisites.each do |course, prereq|
    map[prereq] ||= Set.new
    map[prereq].add(course)
    degree[course] += 1
  end

  count = 0
  queue = []
  degree.each do |course, degrees|
    queue << course if degrees == 0
  end
  until queue.empty?
    prereq = queue.shift
    count += 1
    next unless map[prereq]

    map[prereq].each do |course|
      degree[course] -= 1
      queue << course if degree[course] == 0
    end
  end

  count == num_courses
end

p can_finish2(2, [[1, 0]])
p can_finish2(2, [[1, 0], [0, 1]])