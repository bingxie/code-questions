require_relative '../data_structures/union_find.rb'

def minimum_city_roads  (num_cities, num_roads, available_roads, num_new_roads, new_roads_costs)
  uf = UnionFind.new(num_cities)

  available_roads.each do |road|
    uf.union(road[0], road[1])
  end

  sorted_new_road = new_roads_costs.sort_by {|new_road| new_road[2]}

  total_cost = 0
  sorted_new_road.each do |road|
    unless uf.connected?(road[0], road[1])
      uf.union(road[0], road[1])
      total_cost += road[2]
    end
  end

  total_cost
end

pp minimum_city_roads(6, 3, [[1,4], [4,5], [2,3]], 4, [[1,2,5], [1,3,10], [1,6,2], [5,6,5]]) # 7

pp minimum_city_roads(6, 3, [[1,4], [4,5], [2,3]], 4, [[1,2,5], [1,3,10], [1,6,2], [5,6,5], [1,4,3]]) # 7