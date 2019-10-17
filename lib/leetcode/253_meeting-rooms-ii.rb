require_relative '../data_structures/queues/priority_queue.rb'

# @param {Integer[][]} intervals
# @return {Integer}
def min_meeting_rooms(intervals)
  return 0 if intervals.size == 0

  intervals.sort_by! {|start, _end| start}

  first = intervals[0]
  pq = PriorityQueue.new(:min)
  pq.push(first.last)

  intervals[1..intervals.size - 1].each do |interval|
    pq.pop if interval.first >= pq.peek

    pq.push interval.last
  end

  pq.size
end

intervals = [[0, 30],[5, 10],[15, 20]]

p min_meeting_rooms(intervals)
