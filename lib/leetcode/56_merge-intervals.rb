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