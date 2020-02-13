# @param {NestedInteger[]} nested_list
# @return {Integer}
def depth_sum_inverse(nested_list)
  total_depth = dfs_total_depth(nested_list)
  sum_helper(nested_list, 0, total_depth)
end

def sum_helper(list, depth, total_depth)
  sum = 0

  list.each do |ni|
    sum += if ni.is_integer
             ni.get_integer * (total_depth - depth)
           else
             sum_helper(ni.get_list, depth + 1, total_depth)
           end
  end

  sum
end

def dfs_total_depth(list, level = 1)
  max_level = level

  list.each do |ni|
    next if ni.is_integer

    max_level = [dfs_total_depth(ni.get_list, level + 1), max_level].max
  end

  max_level
end

# 先用BFS的方法找到最大的深度。（也可以用DFS找深度）
def bfs_total_depth(list)
  max_depth = 0
  queue = []

  list.each do |ni|
    queue.push [ni, 1]
  end

  until queue.empty?
    ni, level = queue.pop
    max_depth = [max_depth, level].max

    next if ni.is_integer

    ni.get_list.each do |item|
      queue.push [item, level + 1]
    end
  end

  max_depth
end
