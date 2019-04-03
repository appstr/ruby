def highest_population_year(people)
  highest_hash = Hash.new(0)
  highest_years = []
  people.each_value do |obj|
    (obj[:birth_year]..obj[:death_year]).each {|year| highest_hash[year] += 1}
  end
  highest_pop = highest_hash.values.max
  highest_hash.each_pair do |year, pop|
    highest_years << year.to_s if highest_pop == pop
  end
  print "The highest years are"
  highest_years.each {|year| print ", #{year}"}
  print "."
  puts ""
end

# O(n^2)

people = {"Bob" => {birth_year: 1944, death_year: 1992}, "Jim" => {birth_year: 1958, death_year: 1992}, "Billy" => {birth_year: 1990, death_year: 3047}}

highest_population_year(people)
