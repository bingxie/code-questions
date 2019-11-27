def find_directories(directory)
  Dir.foreach(directory) do |filename|
    fullname = "#{directory}/#{filename}"
    if File.directory?(fullname) && filename != '.' && filename != '..'
      puts fullname

      find_directories(fullname)
    end
  end
end

find_directories('./lib')
