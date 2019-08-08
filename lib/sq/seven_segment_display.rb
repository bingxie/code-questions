class Display

end

def print
  puts " _ \n|_|\n|_|"
end

def print(num)
  nums = []
  puts nums[0] = [" _ ", "| |", "|_|"]

  puts nums[1] = ['   ', '  |', '  |']

  3.times do |i|
    puts "#{nums[0][i]}#{nums[1][i]}"
  end
end

print(1)
