require 'set'
# @param {String[][]} equations
# @param {Float[]} values
# @param {String[][]} queries
# @return {Float[]}
def calc_equation(equations, values, queries)
  graph = Hash.new { |hash, key| hash[key] = [] }

  equations.each_with_index do |pair, index|
    current_value = values[index]
    a = pair.first
    b = pair.last

    graph[a].push [b, current_value]
    graph[b].push [a, (1 / current_value).round(3)]
  end

  results = []

  queries.each do |query|
    results.push(evaluate(query, graph))
  end

  results
end

def evaluate(query, neighbors)
  a, b = query

  return -1 if !neighbors.key?(a) || !neighbors.key?(b)

  queue = neighbors[a].dup
  visited = Set.new

  until queue.empty?
    next_key, value = queue.shift

    return value if next_key == b

    visited.add next_key

    neighbors[next_key]&.each do |key, new_value|
      next if visited.include?(key)

      queue.push [key, new_value * value]
    end
  end

  -1
end

equations = [%w[a b], %w[b c]]
values = [2.0, 3.0]
queries = [%w[a c], %w[b a], %w[a e], %w[a a], %w[x x]]

p calc_equation(equations, values, queries)
