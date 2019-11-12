# Tags: union find, graph
require_relative '../data_structures/disjoint_set_union.rb'
# @param {Integer[][]} edges
# @return {Integer[]}
def find_redundant_connection(edges)
  dsu = DisjointSetUnion.new(1000)

  edges.each do |edge|
    return edge unless dsu.union(edge[0], edge[1])
  end
end

edges = [[1, 2], [1, 3], [2, 3]]
p find_redundant_connection(edges)

edges = [[1, 2], [2, 3], [3, 4], [1, 4], [1, 5]]
p find_redundant_connection(edges)
