t = Thread.new do
  sleep 1
  puts 10**10
end
puts "hello"
t.join
