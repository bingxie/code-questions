# Time complexity: O(nlog(n)), where n is the total content of logs
# Space complexity : O(n)

# @param {String[]} logs
# @return {String[]}
def reorder_log_files(logs)
  logs.sort_by do |log|
    segments = log.split(' ')
    id = segments[0]
    rest = segments[1..-1]

    if rest[0] =~ /[A-Za-z]/
      [0, rest, id]
    else
      [1]
    end
  end
end

logs = ["a1 9 2 3 1","g1 act car","zo4 4 7","ab1 off key dog","a8 act zoo"]
pp reorder_log_files(logs)