class UnionFind
  attr_reader :leaders
  def initialize(n)
    @leaders = 1.upto(n).inject([]) { |leaders, i| leaders[i] = i; leaders }
  end

  def connected?(id1,id2)
    @leaders[id1] == @leaders[id2]
  end

  def union(id1,id2)
    leader_1, leader_2 = @leaders[id1], @leaders[id2]
    @leaders.map! {|i| (i == leader_1) ? leader_2 : i }
  end
end

uf = UnionFind.new(5)
p uf.leaders

uf.union(2,3)
p uf.leaders

uf.union(4,5)
p uf.leaders

uf.union(2,5)
p uf.leaders
