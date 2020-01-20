# @param {Integer[][]} intervals
# @return {Integer[][]}
def merge(intervals)
  return [] if intervals.empty?

  intervals.sort!

  results = []
  latest_start, latest_end = intervals.first
  results.push [latest_start, latest_end]

  intervals[1..-1].each do |new_start, new_end|
    if new_start <= latest_end
      latest_end = [latest_end, new_end].max
      results[-1] = [latest_start, latest_end]
    else
      results.push [new_start, new_end]
      latest_start = new_start
      latest_end = new_end
    end
  end

  results
end

intervals = [[1,3],[2,6],[8,10],[15,18]]

p merge(intervals) # [[1,6],[8,10],[15,18]]

intervals = [[1,4],[4,5]]
p merge(intervals)  # [[1,5]]


# @param {Integer[][]} intervals
# @return {Integer[][]}
def merge2(intervals)
  return [] if intervals.empty?

  intervals.sort!

  results = [intervals.first]

  intervals[1..-1].each do |interval|
    new_start = interval[0]
    new_end = interval[1]

    current_end = results.last[1]

    if new_start > current_end
      results.push [new_start, new_end]
    else
      tmp_end = [new_end, current_end].max
      results.last[1] = tmp_end
    end
  end

  results
end
