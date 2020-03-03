require 'fileutils'

FileUtils.compare_file('a.txt', 'b.txt')
FileUtils.touch('/tmp/lock') # update the last access & modification time
FileUtils.cp_r('data', 'backup') # the “r” in cp_r stands for “recursive”.

# mkdir_p that create nested directories in one step.
FileUtils.mkdir_p("/tmp/testing/a/b")

# FileUtils also brings extra options for all file operations in the form of keyword arguments. Like the verbose option (prints Linux commands) & the noop (don’t change files) option.

# rename a directory
FileUtils.mv("/tmp/a", "/tmp/b")
