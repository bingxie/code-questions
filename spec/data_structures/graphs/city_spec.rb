require 'spec_helper'

RSpec.describe BinaryTree do
  it '' do
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
  end
end
