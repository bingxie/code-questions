class City
  attr_accessor :name, :routes

  def initialize(name)
    @name = name
    @routes = {}
  end

  def add_route(city, price)
    @routes[city] = price
  end

  def self.dijkstra(starting_city, others)
    routes_from_city = {}

    routes_from_city[starting_city] = [0, starting_city]

    others.each do |city|
      routes_from_city[city] = [Float::INFINITY, nil]
    end

    visited_cities = []

    current_city = starting_city

    while current_city
      visited_cities << current_city

      current_city.routes.each do |city, price|
        new_price = price + routes_from_city[current_city][0]
        if routes_from_city[city][0] > new_price
          routes_from_city[city] = [new_price, current_city]
        end
      end

      current_city = nil
      cheapest_route_from_current_city = Float::INFINITY

      routes_from_city.each do |city, price_info|
        if price_info[0] < cheapest_route_from_current_city && !visited_cities.include?(city)
          cheapest_route_from_current_city = price_info[0]
          current_city = city
        end
      end
    end

    routes_from_city
  end
end
