# Tags: undirected graph, DFS, graph
require 'set'

class Graph
  attr_reader :nodes

  def initialize
    @nodes = Hash.new { |hash, key| hash[key] = Set.new }
  end

  # edge: [1, 3]
  def add_edge(edge)
    @nodes[edge[0]].add edge[1]
    @nodes[edge[1]].add edge[0]
  end

  def neighbors(node)
    @nodes[node]
  end

  def exist?(node)
    !neighbors(node).empty?
  end
end

# @param {Integer[][]} edges
# @return {Integer[]}
def find_redundant_connection(edges)
  graph = Graph.new
  seen = Set.new

  edges.each do |edge|
    seen.clear

    return edge if graph.exist?(edge[0]) && graph.exist?(edge[1]) && dfs_source_target(graph, edge[0], edge[1], seen)

    graph.add_edge(edge)
  end
end

def dfs_source_target(graph, source, target, seen)
  unless seen.include?(source)
    seen.add(source)

    return true if source == target

    graph.neighbors(source).each do |nei|
      return true if dfs_source_target(graph, nei, target, seen)
    end
  end

  false
end

edges = [[1, 2], [1, 3], [2, 3]]
p find_redundant_connection(edges)

edges = [[1, 2], [2, 3], [3, 4], [1, 4], [1, 5]]
p find_redundant_connection(edges)
