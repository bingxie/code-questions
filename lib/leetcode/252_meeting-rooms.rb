# @param {Integer[][]} intervals
# @return {Boolean}
def can_attend_meetings(intervals)
  sorted_intervals = intervals.sort_by do |st, et|
    st
  end
  first_interval = sorted_intervals.first

  prev_end = first_interval.last

  sorted_intervals[1..-1].each do |current_start, current_end|
    return false if current_start < prev_end

    prev_end = current_end
  end
  true
end

p can_attend_meetings([[0,30],[5,10],[15,20]])  # false
p can_attend_meetings([[7,10],[2,4]])  # true
