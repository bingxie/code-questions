class LRUCache
  # Hashes enumerate their values in the order that the corresponding keys were inserted.
  attr_reader :elems, :capacity

  # Initialize your data structure here
  # @param {Integer} capacity
  def initialize(capacity)
    @capacity = capacity
    @elems = {}
  end

  # @param {Integer} key
  # @return {Integer}
  def get(key)
    val = elems.delete key  # 先从 hash 中删除
    if val
      elems[key] = val   # 然后重新放进去就会在最后
    else
      -1
    end
  end

  # @param {Integer} key
  # @param {Integer} value
  # @return {Void}
  def put(key, value)
    elems.delete key  # 如果已经存在，先从Hash中删除
    elems[key] = value # 重新放进去，这样继续维持顺序

    # elems.first.first 第一个key
    elems.delete(elems.first.first) if elems.size > capacity  # 超过 Capacity 后，总是从最前面删掉
  end
end

