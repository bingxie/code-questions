# @param {Integer} n
# @param {Integer[][]} edges
# @return {Boolean}
def valid_tree(n, edges)
  # return false if edges.length != n - 1  # 方法一： 本题是验证树，可以用树的特性来判断。（可以判断孤儿节点或者有环）

  graph = build_graph(edges)

  queue = [0]
  visited = {}

  until queue.empty?
    current = queue.shift

    visited[current] = true
    visited_num = 0

    graph[current].each do |nei|
      if !visited[nei]
        queue.push nei
      else
        visited_num += 1
      end
    end

    return false if visited_num > 1 # 对于BFS，除了父节点，还有子节点已经被访问了，存在环
  end

  visited.length == n
end

def build_graph(edges)
  graph = Hash.new { |hash, key| hash[key] = [] }

  edges.each do |from, to|
    graph[from].push to
    graph[to].push from
  end

  graph
end
require 'set'
def valid_tree2(n, edges)
  graph = build_graph(edges)
  visited = Set.new
  parent_map = {}

  return false if dfs_circle?(0, graph, visited, parent_map)

  visited.size == n
end

def dfs_circle?(node, graph, visited, parent_map, has_circle = false)
  visited.add(node)

  graph[node].each do |nei|
    if visited.include?(nei)
      has_circle = true if parent_map[node] != nei
    else
      parent_map[nei] = node
      has_circle = dfs_circle?(nei, graph, visited, parent_map, has_circle)
    end
  end

  has_circle
end

n = 5
edges = [[0, 1], [0, 2], [0, 3], [1, 4]]

p valid_tree(n, edges) # true
p valid_tree2(n, edges) # true

edges = [[0, 1], [1, 2], [2, 3], [1, 3], [1, 4]]
p valid_tree(n, edges) # false
p valid_tree2(n, edges) # false
