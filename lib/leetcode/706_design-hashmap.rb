class MyHashMap
  def initialize
    @store = []
  end

  def put(key, value)
    @store[key] = value
  end

  def get(key)
    @store[key] || -1
  end

  def remove(key)
    @store[key] = nil
  end
end
# Your MyHashMap object will be instantiated and called as such:
obj = MyHashMap.new()
obj.put(1, 2)
p obj.get(1)
obj.remove(1)
