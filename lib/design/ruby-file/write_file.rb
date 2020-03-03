dir_path = File.dirname(File.absolute_path(__FILE__))
file_path = File.join(dir_path, 'log.txt')

File.open(file_path, 'w') do |file|
  file.write "#{Time.now} - User logged in\n"
  file.write "#{Time.now} - User logged out\n"
end
# This will rewrite the previous file contents!

# add content to the file, use a 'a' (append) flag
File.open(file_path, 'a') do |file|
  file.write "#{Time.now} - User logged in\n"
  file.write "#{Time.now} - User logged out\n"
end

# shortcut to use File.write
File.write(file_path, "data ...\n")

# shortcut in append mode
File.write(file_path, "data ...\n", mode: 'a')
