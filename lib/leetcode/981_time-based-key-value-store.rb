class TimeMap
  attr_accessor :map
  def initialize
    @map = {}
  end

  def set(key, value, timestamp)
    @map[key] = [] if @map[key].nil?
    @map[key].push [value, timestamp]
  end

  def get(key, timestamp)
    return '' if @map[key].nil?

    inner_array = @map[key]

    left = 0
    right = inner_array.length - 1

    while left < right
      mid = (left + right) / 2 + 1   # 注意mid的处理

      if timestamp < inner_array[mid][1]
        right = mid - 1
      else
        left = mid
      end
    end

    inner_array[left][1] <= timestamp ? inner_array[left][0] : ''
  end

  def soft_delete(key, timestamp)
    return nil if @map[key].nil?

    inner_array = @map[key]

    inner_array.each do |item|
      if item[1] == timestamp
        item.append("deleted")
      end
    end
  end
end

kv = TimeMap.new

# kv.set('foo', 'bar', 1)
# p kv.map
# p kv.get('foo', 1)
# p kv.get('foo', 3)

# kv.set('foo', 'bar2', 4)
# p kv.map
# p kv.get('foo', 5)

kv.set('love', 'v10', 10)
kv.set('love', 'v20', 20)
kv.set('love', 'v30', 30)

p kv.map
p kv.get('love', 5)
p kv.get('love', 10)  # v10
p kv.get('love', 15)  # v10
p kv.get('love', 20)  # v20
p kv.get('love', 25)  # v20

p kv.soft_delete('love', 20)
p kv.map
