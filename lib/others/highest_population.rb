def highest_population_year(people_years)  # n : number of people, years range: k  => O(n*k)
  start_year = 11  # O(n)
  end_year = 19   # O(n)

  years_count = Hash.new(0)


  (start_year..end_year).each do |year|
    people_years.each do |birth, death|
      if year >= birth && year <= death
        years_count[year] += 1
      end
    end
  end

  years_count.sort_by {|_key, count| count}.last.first
end

people_years = [[11, 15], [12, 16], [13, 17], [14, 18], [15, 19]]
# 11: 1
# 12: 2
# 13: 3

highest_population_year(people_years)
