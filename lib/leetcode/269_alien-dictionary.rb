require 'set'
# @note This uses BFS and Topological Sort using Kahn's Algorithm
# @param {String[]} words
# @return {String}
def alien_order(words)
  return '' if !words || words.empty?
  return words[0].reverse if words.size == 1

  @graph = {}
  @in_deg = Array.new(26, 0)
  result = ''
  q = []

  build_graph_bfs(words)

  @graph.keys.each { |x| q.push(x) if @in_deg[x].zero? }
  until q.empty?
    next_c = q.shift
    result += (next_c + 'a'.ord).chr
    @graph[next_c].each do |nbr|
      @in_deg[nbr] -= 1
      q.push(nbr) if @in_deg[nbr].zero?
    end
  end
  @graph.size != result.size ? '' : result
end

def build_graph_bfs(words)
  words.each_cons(2) do |w1, w2|
    break unless add_words_to_graph_bfs(w1, w2)
  end
end

def add_words_to_graph_bfs(w1, w2)
  add_vertices_bfs(w1)
  add_vertices_bfs(w2)
  m = w1.size
  n = w2.size
  min_len = [m, n].min
  found = false

  0.upto(min_len - 1) do |i|
    c1 = w1[i].ord - 'a'.ord
    c2 = w2[i].ord - 'a'.ord
    next if c1 == c2

    unless @graph[c1].include?(c2)
      @in_deg[c2] += 1
      @graph[c1].add(c2)
    end
    p "c1: #{c1} #{w1[i]} c2: #{c2} #{w2[i]}"
    p @graph

    found = true
    break
  end

  return false if !found && m > n

  true
end

def add_vertices_bfs(w)
  w.each_char do |c|
    d = c.ord - 'a'.ord
    @graph[d] = Set.new unless @graph.key?(d)
  end
end

words = %w[
  wrt
  wrf
  er
  ett
  rftt
]
p alien_order(words)

words = ['oiu']
p alien_order(words)
