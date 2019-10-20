def find_nodes_with_zero_and_one_parents(parent_child_pairs)
  child_hash = {}

  parent_child_pairs.each do |parent, child|
    child_hash[child] ||= []
    child_hash[parent] ||= []

    child_hash[child] << parent
  end
  zero_parents = []
  one_parent = []

  child_hash.each do |child, parents|
    if parents.empty?
      zero_parents.push child
    end

    if parents.size == 1
      one_parent.push child
    end
  end

  p [zero_parents, one_parent]
end

parent_child_pairs = [[1, 3], [2, 3], [3, 6], [5, 6], [5, 7], [4, 5], [4, 8], [8, 10], [11, 2]]
find_nodes_with_zero_and_one_parents(parent_child_pairs)

def has_common_ancestor(parent_child_pairs, c1, c2)
  child_hash = {}

  parent_child_pairs.each do |parent, child|
    child_hash[child] = [] unless child_hash[child]

    child_hash[child] << parent
  end
  p child_hash

  c1_ancestors = find_ancestors(c1, child_hash)
  c2_ancestors = find_ancestors(c2, child_hash)

  common = c1_ancestors & c2_ancestors

  !common.empty?
end

def find_ancestors(child, child_hash, ancestors = [])
  child_hash[child]&.each do |parent|
    ancestors.push parent
    find_ancestors(parent, child_hash, ancestors)
  end
  return ancestors
end

p has_common_ancestor(parent_child_pairs, 6, 8)

parent_child_pairs = [[1, 3], [2, 3], [3, 6], [5, 6], [5, 7], [4, 5], [4, 8], [8, 10], [11, 2]]

def make_child_hash(parent_child_pairs)
  child_hash = {}

  parent_child_pairs.each do |parent, child|
    child_hash[child] = [] unless child_hash[child]

    child_hash[child] << parent
  end
  child_hash
end

def find_earliest_ancestor(parent_child_pairs, child)
  child_hash = make_child_hash(parent_child_pairs)

  return nil if child_hash[child].nil?

  queue = child_hash[child]

  earliest = nil
  while !queue.empty?
    earliest = queue.shift

    child_hash[earliest]&.each do |parent|
      queue.push parent
    end
  end

  earliest
end

p find_earliest_ancestor(parent_child_pairs, 8)
p find_earliest_ancestor(parent_child_pairs, 7)
p find_earliest_ancestor(parent_child_pairs, 6)
p find_earliest_ancestor(parent_child_pairs, 1)
