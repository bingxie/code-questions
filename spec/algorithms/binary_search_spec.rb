require 'spec_helper'

RSpec.describe Algorithms::BinarySearch do
  it 'finds the target index' do
    sorted_array = [1,3,5,7,9,11,13]
    index = described_class.search(sorted_array, 11)

    expect(index).to eq 5

    index = described_class.search(sorted_array, 1)
    expect(index).to eq 0

    index = described_class.search(sorted_array, 13)
    expect(index).to eq 6
  end

  it 'finds target in a array with 2 items' do
    sorted_array = [1,3]
    expect(described_class.search(sorted_array, 1)).to eq 0
    expect(described_class.search(sorted_array, 3)).to eq 1
  end

  it 'finds target in a array with only 1 item' do
    sorted_array = [1]
    expect(described_class.search(sorted_array, 1)).to eq 0
  end

  context 'when target is not in the array' do
    it 'returns nil' do
      sorted_array = [1,3]
      expect(described_class.search(sorted_array, 2)).to be nil
    end
  end

  context 'when array is empty' do
    it 'returns nil' do
      sorted_array = []
      expect(described_class.search(sorted_array, 2)).to be nil
    end
  end

  context 'when array is nil' do
    it 'raises exception' do
      sorted_array = nil
      expect { described_class.search(sorted_array, 2) }.to raise_error 'sorted_array can not be nil'
    end
  end
end
