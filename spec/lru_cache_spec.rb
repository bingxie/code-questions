require 'spec_helper'

RSpec.describe LRUCache do
  it "test the get and put methods" do
    cache = LRUCache.new(2)

    cache.put(1, 1)
    cache.put(2, 2)
    expect(cache.get(1)).to eq 1

    cache.put(3, 3)
    expect(cache.get(2)).to eq -1
    cache.put(4, 4)
    expect(cache.get(1)).to eq -1

    expect(cache.get(3)).to eq 3
    expect(cache.get(4)).to eq 4
  end
end
