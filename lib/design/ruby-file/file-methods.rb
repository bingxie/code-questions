# Renaming a file
File.rename('old-name.txt', 'new-name.txt')

# File size in bytes
File.size('users.txt')

# Does this file already exist?
File.exist?('log.txt')

# Get the file extension, this works even if the file doesn't exists
File.extname('users.txt')
# => ".txt"

# Get the file name without the directory part
File.basename('/tmp/ebook.pdf')
# => "ebook.pdf"

# Get the path for this file, without the file name
File.dirname('/tmp/ebook.pdf')
# => "/tmp"

# Is this actually a file or a directory?
File.directory?('cats')

# get stats for a file, like file size, permissions, creation date, etc:
File.stat("/tmp")
