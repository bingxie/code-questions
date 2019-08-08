def histogram_bar(nums)
  max_num = nums.max

  base_length = 20

  nums.each do |num|
    count = ((num / max_num) * base_length).round
    print_bar(count)
  end
end

def print_bar(count)
  s = ''
  count.times { s << '#' }
  puts s
end

histogram_bar([34.7, 53.5, 103.0])


def matrix
  i = 20
  j = 20
  points = [[20,20], [3,4], [10,10]]
  1.upto(i) do |i|
    s = ''
    1.upto(j) do |j|
      if points.include?([j, 21-i])
        s << ' #'
      else
        s << ' *'
      end
    end
    puts s
  end
end

matrix