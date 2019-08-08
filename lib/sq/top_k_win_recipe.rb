require_relative '../data_structures/queues/priority_queue.rb'
require 'set'

class Recipe
  include Comparable

  attr_reader :score
  def initialize(recipe_items, score)
    @items = recipe_items
    @score = score
  end

  def <=> (other)
    score <=> other.score
  end

  def inspect
    @items.to_a.join(',') + ' ' + score.to_s
  end
end

def print_top_k_win(matches, k)
  return if matches.nil? || matches.empty?

  recipe_scores = Hash.new(0)

  matches.each do |match|
    recipe_items = Set.new

    if match[-1] == "leftWin"
      recipe_items.add match[0]
      recipe_items.add match[1]
      recipe_items.add match[2]
    else
      recipe_items.add match[3]
      recipe_items.add match[4]
      recipe_items.add match[5]
    end

    recipe_scores[recipe_items] += 1
  end

  # pp recipe_scores.sort_by {|key, value| value}
  pq = PriorityQueue.new(:min)
  recipe_scores.each do |items, score|
    recipe = Recipe.new(items, score)
    pq.push recipe
    pq.pop if pq.size > k
  end

  pp pq.items
end


m1 = %w[Apple Orange Pear Flour Rice Corn leftWin]
m2 = %w[Flour Corn Rice Grape Cherry Orange rightWin]
m6 = %w[Flour Corn Rice Grape Cherry Orange rightWin]
m3 = %w[Rice Flour Corn Grape Orange Cherry rightWin]
m4 = %w[App Orange Pear Flour Rice Corn leftWin]
m5 = %w[App Orange Pear Flour Rice Corn leftWin]
matches = [m1, m2, m3, m4, m5, m6]

print_top_k_win(matches, 2)

