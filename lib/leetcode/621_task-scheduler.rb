# @param {Character[]} tasks
# @param {Integer} n
# @return {Integer}
def least_interval(tasks, n)
  tasks_count = Array.new(26, 0)

  tasks.each do |task|
    index = task.ord - 'A'.ord
    tasks_count[index] += 1
  end

  max_count = tasks_count.sort!.last
  total_space = (max_count - 1) * n

  tasks_count[0..24].each do |count|
    next if count == 0

    remove_count = [max_count - 1, count].min # 应对有多个tasks都是max_count个?
    total_space -= remove_count
  end

  total_space > 0 ? tasks.size + total_space : tasks.size
end

tasks = %w[A A A B B B C D E F]
n = 2
puts least_interval(tasks, n) # 8
