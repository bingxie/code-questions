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


def min_meeting_rooms2(intervals)
  return 0 if intervals&.size == 0

  starts = []
  ends = []

  intervals.each do |intervial|
    starts.push intervial[0]
    ends.push intervial[1]
  end

  starts.sort!
  ends.sort!

  rooms_count = 0
  end_pointer = 0

  starts.each do |start|
    if start >= ends[end_pointer]
      rooms_count -= 1
      end_pointer += 1
    end

    rooms_count += 1
  end

  rooms_count
end

intervals = [[0, 30],[5, 10],[15, 20]]

p min_meeting_rooms2(intervals)
