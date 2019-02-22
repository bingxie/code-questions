require 'spec_helper'

RSpec.describe QueueTwoStacks do
  let(:queue) { QueueTwoStacks.new }

  it 'enqueue and dequeue with right sequence' do
    queue.enqueue(1)
    queue.enqueue(2)
    queue.enqueue(3)

    expect(queue.dequeue).to eq 1
    expect(queue.dequeue).to eq 2

    queue.enqueue(4)
    expect(queue.dequeue).to eq 3
    expect(queue.dequeue).to eq 4
  end

  it 'raise error when dequeue from new queue' do
    expect { queue.dequeue }.to raise_error(RuntimeError, 'queue is empty now')
  end

  it 'raise error when dequeue from empty queue' do
    queue.enqueue(1)
    queue.enqueue(2)

    queue.dequeue
    queue.dequeue

    expect { queue.dequeue }.to raise_error(RuntimeError, 'queue is empty now')
  end
end
