require 'spec_helper'

RSpec.describe FindRotationPoint do
  it 'find the rotation point' do
    words = ['grape', 'orange', 'plum', 'radish', 'apple']
    point = FindRotationPoint.call(words)

    expect(point).to eq 4
  end

  it 'finds index in a large array' do
    words = ['ptolemaic', 'retrograde', 'supplant',
      'undulate', 'xenoepist', 'asymptote',
      'babka', 'banoffee', 'engender',
      'karpatka', 'othellolagkage']
    point = FindRotationPoint.call(words)

    expect(point).to eq 5
  end

  it 'finds index in a small array' do
    words = ['cape', 'cake']

    point = FindRotationPoint.call(words)

    expect(point).to eq 1
  end
end
