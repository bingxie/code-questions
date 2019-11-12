class LFUCache
  # Hashes enumerate their values in the order that the corresponding keys were inserted.
  attr_reader :elems, :capacity, :lfu

  # Initialize your data structure here
  # @param {Integer} capacity
  def initialize(capacity)
    @capacity = capacity
    @elems = {}
    @lfu = {}
  end

  # @param {Integer} key
  # @return {Integer}
  def get(key)
    val = @elems[key]

    return -1 if val.nil?

    increase_freq(key)

    val
  end

  # @param {Integer} key
  # @param {Integer} value
  # @return {Void}
  def put(key, value)
    return nil if capacity == 0

    @elems[key] = value

    if @lfu.key?(key)
      increase_freq(key)
    else # 新增的key，要处理超过capacity的情况
      if @elems.size > capacity
        lfu_key = @lfu.min_by { |_k, v| v }.first

        @elems.delete(lfu_key)
        @lfu.delete(lfu_key)
      end

      @lfu[key] = 1
    end
  end

  def increase_freq(key)
    freq = @lfu[key]
    @lfu.delete(key)
    @lfu[key] = freq + 1 # 也需要重新插入保持顺序
  end
end

cache = LFUCache.new(2)

cache.put(2, 1)
p "elemes: #{cache.elems}  #{cache.lfu}"

cache.put(3, 2)
p "elemes: #{cache.elems}  #{cache.lfu}"

p cache.get(3)
p "elemes: #{cache.elems}  #{cache.lfu}"

p cache.get(2)
p "elemes: #{cache.elems}  #{cache.lfu}"

cache.put(4, 3)
p "elemes: #{cache.elems}  #{cache.lfu}"
