class RandomizedSet
  def initialize
    @hash = {}
    @nums = []
  end

  def insert(val)
    return false if @hash.key?(val)

    @nums << val
    @hash[val] = @nums.size - 1
    true
  end

  def remove(val)
    return false unless @hash.key?(val)

    @hash[@nums.last] = @hash[val] # if val != @nums.last
    @nums[@hash[val]] = @nums.last
    @nums.pop
    @hash.delete(val)
    true
  end

  def get_random
    @nums[rand(@nums.size)]
  end
end
