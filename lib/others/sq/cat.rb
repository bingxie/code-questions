class Cat
  attr_accessor :name, :height, :weight

  def initialize(name, height, weight)
    @name = name
    @height = height
    @weight = weight
  end

  def self.build_cat_list(names, heights, weights)
    return [] if names&.empty?

    cat_list = CatList.new
    names.each_with_index do |name, i|
      cat = Cat.new(name, heights[i], weights[i])
      cat_list.add cat
    end

    cat_list
  end
end

class CatList
  def initialize
    @list = []
  end

  def add(cat)
    @list.push cat
  end

  def self.search(_query_string)
    # (WEIGHT < 4200 AND HEIGHT > 234) OR (HEIGHT < 235)
    results1 = single_query('WEIGHT', 4200, '<')
    results2 = single_query('HEIGHT', 234, '>')
    results3 = single_query('HEIGHT', 235, '<')

    or_query(and_query(results1, results2), results3)
  end

  def single_query(criteria, value, symbol)
    criteria_methods = { 'HEIGHT' => :height, 'WEIGHT' => :weight }
    symbol_methods = { '<' => :<, '>' => :>, '=' => :== }

    # compare_method = case symbol
    #                  when '<'
    #                    :<
    #                  when '>'
    #                    :>
    #                  when '='
    #                    :==
    #                 end
    # p "compare_method #{compare_method}"

    @list.select do |cat|
      cat.send(criteria_methods[criteria]).send(symbol_methods[symbol], value)
    end
  end

  def and_query(results1, results2)
    results1 & results2
  end

  def or_query(results1, results2)
    results1 | results2
  end
end

cat = Cat.new('a', 31, 120)
p cat

names = %w[a b c d e f g h] # %w
heights = [31, 24, 67, 12, 45, 21, 31, 12]
weights = [120, 124, 160, 130, 175, 120, 124, 142]

cat_list = Cat.build_cat_list(names, heights, weights)

pp cat_list.single_query('HEIGHT', 43, '<')

pp cat_list.single_query('HEIGHT', 43, '>')

pp cat_list.single_query('WEIGHT', 120, '=')
