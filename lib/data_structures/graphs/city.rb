class City
  attr_accessor :name, :routes

  def initialize(name)
    @name = name
    @routes = {}
  end

  def add_route(city, price)
    @routes[city] = price # {boston: 100, denver: 160}
  end

  def self.dijkstra(starting_city, others)
    routes_from_city = {}

    routes_from_city[starting_city] = [0, starting_city]

    others.each do |city|
      routes_from_city[city] = [Float::INFINITY, nil]
    end

    routes_from_city.each {|from, v| p "from: #{from.name} to #{v[1]&.name} price: #{v[0]}"}

    visited_cities = []

    current_city = starting_city

    while current_city
      visited_cities << current_city

      current_city.routes.each do |city, price|
        new_price = price + routes_from_city[current_city][0]

        routes_from_city[city] = [new_price, current_city] if routes_from_city[city][0] > new_price
      end
      puts "------------"
      routes_from_city.each {|from, v| p "from: #{from.name} to #{v[1]&.name} price: #{v[0]}"}

      current_city = nil
      cheapest_route_from_current_city = Float::INFINITY

      # select next city
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

atlanta = City.new('Atlanta')
boston = City.new('Boston')
chicago = City.new('Chicago')
denver = City.new('Denver')
el_paso = City.new('El Paso')

atlanta.add_route(boston, 100)
atlanta.add_route(denver, 160)
boston.add_route(chicago, 120)
boston.add_route(denver, 180)
chicago.add_route(el_paso, 80)
denver.add_route(chicago, 40)
denver.add_route(el_paso, 140)

routes = City.dijkstra(atlanta, [boston, chicago, denver, el_paso])
routes.each do |city, price_info|
  p "#{city.name} #{price_info[0]} #{price_info[1].name}"
end
