class SplitBonus
  attr_reader :result

  def initialize
    @bonus_cap = { A: 100, B: 150, C: 200, D: 500, E: 600 }
    @result = {}
  end

  def split(bonus)
    all_persons = @bonus_cap.keys
    split_by_persons(all_persons, bonus)
  end

  def split_by_persons(persons, bonus)
    return if persons.empty?

    avg = bonus / persons.size

    split_by_avg = persons.all? { |p| @bonus_cap[p] >= avg }

    return avg_split(bonus, persons) if split_by_avg # Base case

    remain_bonus = bonus
    remain_person = []
    persons.each do |p|
      if @bonus_cap[p] <= avg
        @result[p] = @bonus_cap[p]
        remain_bonus -= @bonus_cap[p]
      else
        remain_person << p
      end
    end

    split_by_persons(remain_person, remain_bonus)
  end

  # 500 = 100 100 100 100 100
  def avg_split(bonus, persons)
    avg, remainder = bonus.divmod(persons.size)

    persons.each do |person|
      result[person] = avg
    end

    # 整除后余下的零头给第一个人
    first_person = persons.first
    @result[first_person] = @result[first_person] + remainder if remainder > 0
  end
end

sb = SplitBonus.new
sb.split(1001)
pp sb.result
