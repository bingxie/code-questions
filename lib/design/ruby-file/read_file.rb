dir_path = File.dirname(File.absolute_path(__FILE__))
file_path = File.join(dir_path, 'users.txt')

# open -> read -> close
file = File.open(file_path)

# read the whole file content
# file_data = file.read
# "user1\nuser2\nuser3\n"

file_data = file.readlines.map(&:chomp)
# ["user1", "user2", "user3"]

file.close

# another way
file_data2 = File.read(file_path).split
# ["user1", "user2", "user3"]

# Instead of reading the whole file into memory you’ll be able to process the file one line at a time, which is useful for big files.
File.foreach(file_path) { |line| p line }
