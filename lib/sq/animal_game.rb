require 'set'

class AnimalGame
  attr_reader :cows_count, :pigs_count, :total

  def initialize
    @cows_count = {}
    @pigs_count = {}

    @total = Hash.new(0)
  end

  def add_record(player, cows, pigs)
    cows_count[player] = cows
    pigs_count[player] = pigs

  end

  def print_total_score
    cows_score = animal_score(cows_count)
    pigs_score = animal_score(pigs_count)

    total_score = {}

    cows_score.each do |key, value|
      total_score[key] = value + pigs_score[key]
    end

    p total_score
  end

  def animal_score(animal_count)
    sorted_count = animal_count.sort_by { |_key, value| value }  #返回二位数组 [[key, value], [key, value]]

    result = {}
    score = 1
    sorted_count.each do |key, _value|
      result[key] = score
      score += 1
    end

    if (duplicates = find_duplicates(animal_count.values))
      dup_scores = []
      dup_keys = []
      animal_count.each do |key, value|
        if duplicates.include?(value)
          dup_scores.push result[key]
          dup_keys.push key
        end
      end

      dup_keys.each do |key|
        result[key] = dup_scores.sum / dup_scores.size.to_f
      end
    end

    result
  end

  def find_duplicates(counts)
    s = Set.new

    counts.find_all { |c| !s.add?(c) }
  end

  def output
    p cows_count
    p pigs_count
  end
end

game = AnimalGame.new

game.add_record('A', 3, 2)
game.add_record('B', 5, 1)
game.add_record('C', 4, 3)

#game.output
p game.animal_score(game.cows_count)
p game.animal_score(game.pigs_count)

game.print_total_score

game = AnimalGame.new

game.add_record('A', 3, 2)
game.add_record('B', 3, 1)
game.add_record('C', 4, 3)

game.print_total_score