require 'set';

def draw_circle(radius)
  result = []
  (0..radius * 2).each do |r|
    (0..radius * 2).each do |c|
      x = r - radius  # 注意要减掉半径
      y = c - radius
      if (x * x + y * y) <= radius * radius
        result.push [x, y]
        print '*'
      else
        print ' '
      end
      print ' '
    end
    puts ''
  end

  result
end

result = [[-2, 0], [-1, -1], [-1, 0], [-1, 1], [0, -2], [0, -1], [0, 0], [0, 1], [0, 2], [1, -1], [1, 0], [1, 1], [2, 0]]
p draw_circle(2) == result

def draw_circle2(radius)
  result = []
  count = 0
  (-radius..radius).each do |x|
    (-radius..radius).each do |y|
      if (x * x + y * y) <= radius * radius + radius
        result.push [x, y]
        print '*'
      else
        print ' '
      end
      print ' '
      count += 1
    end
    puts ''
  end
  puts "count: #{count}"
  result
end
draw_circle2(8)

def draw_circle3(radius)
  result = Set.new
  count = 0
  (0..radius).each do |x|
    (0..radius).each do |y|
      if (x * x + y * y) <= radius * radius
        result.add [x, y]
        result.add [-x, y]
        result.add [x, -y]
        result.add [-x, -y]
        result.add [y, x]
        result.add [-y, x]
        result.add [y, -x]
        result.add [-y, -x]
        print '*'
      else
        print ' '
      end
      print ' '
      count += 1
    end
    puts ''
  end

  puts "count: #{count}"
  result.to_a
end
p draw_circle3(3)
