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
  # TODO: rename
  next_courses = {}
  dependencies = {}
  num_courses.times do |course|
    dependencies[course] = 0
  end

  prerequisites.each do |course, prereq|
    next_courses[prereq] ||= Set.new
    next_courses[prereq].add(course)
    dependencies[course] += 1
  end

  p next_courses
  p dependencies

  count = 0
  queue = []

  dependencies.each do |course, total|
    queue << course if total == 0
  end

  until queue.empty?
    prereq = queue.shift
    count += 1
    next unless next_courses[prereq]

    next_courses[prereq].each do |course|
      dependencies[course] -= 1
      queue << course if dependencies[course] == 0
    end
  end

  count == num_courses
end

p can_finish2(2, [[1, 0]])
p can_finish2(2, [[1, 0], [0, 1]])
