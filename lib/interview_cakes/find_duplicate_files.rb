def find_duplicate_files(start_dir)
  files_seen_already = {}

  stack = [start_dir]

  duplicates = []

  while (current_path = stack.pop)
    if File.directory?(current_path)
      Dir.each_child(current_path) do |filename|
        full_path = File.join(current_path, filename)
          stack.push(full_path)
      end
    else

    end

  end

  duplicates
end
