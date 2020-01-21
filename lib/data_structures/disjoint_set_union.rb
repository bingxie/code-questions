# Tags: #Union Find, #Disjoint set union

# https://leetcode.com/articles/redundant-connection/

class DisjointSetUnion
  def initialize(size)
    @parents = Array.new(size)
    @ranks = Array.new(size, 0)

    @parents.each_index do |index|
      @parents[index] = index
    end
  end

  def find(x)
    @parents[x] = find(@parents[x]) if @parents[x] != x # path compression

    @parents[x]
  end

  def union(x, y)
    x_parent = find(x)
    y_parent = find(y)

    return false if x_parent == y_parent

    if @ranks[x_parent] < @ranks[y_parent]
      @parents[x_parent] = y_parent
    elsif @ranks[x_parent] > @ranks[y_parent]
      @parents[y_parent] = x_parent
    else
      @parents[y_parent] = x_parent
      @ranks[x_parent] += 1
    end

    true
  end

  def inspect
    "parents: #{@parents}, ranks: #{@ranks}"
  end
end

# dsu = DisjointSetUnion.new(5)
# p dsu

# p dsu.union(1, 2)
# p dsu

# p dsu.union(3, 4)
# p dsu

# p dsu.union(2, 4)
# p dsu

# p dsu.union(3, 4)
# p dsu
