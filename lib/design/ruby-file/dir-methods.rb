# All files in current directory
Dir.glob('*')
# All files containing "spec" in the name
Dir.glob('*spec*')
# All ruby files
Dir.glob('*.rb')

# find files inside all folders?
Dir.glob('**/*.rb')

# recursively list all files in Ruby, starting from the current directory:
Dir.glob('**/**')

# only want to search for directories
Dir.glob('**/**/')

# print the current working directory
Dir.pwd

# Check if a directory is empty:
Dir.empty?('/tmp')

# Check if a directory exists:
Dir.exist?('/home/jesus')

# Create a new directory
Dir.mkdir('/tmp/testing')
# You can get a few errors:
# Directory already exists (Errno::EEXIST)
# Permission denied (Errno::EACCES)
# You’re trying to create a folder under another folder that doesn’t exist yet (Errno::ENOENT)

# Create a temporary directory with mktmpdir
Dir.mktmpdir do |dir|
  File.write(dir + '/log.txt', 'test')
end

# This entries method returns an array of filename entries.
filenames = Dir.entries('.') #  dot (.) represents the current directory.

# Change your current directory
Dir.chdir('/tmp') { Dir.entries('.') }
# With a block, the current directory changes only for the code inside the block
# Without a block, it changes for all the code after the method call
# Notice that chdir only works within your Ruby process, it doesn’t affect the “outside world”.
