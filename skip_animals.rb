def skip_animals(animals, skip)
  new_arry = []
  animals.each_with_index do |animal, index|
    if index >= skip
      new_arry << "#{index}:#{animal}"
    end
  end
  new_arry
end

animals = ["dog", "cat", "horse", "snake"]
skip = 2

print skip_animals(animals, skip)
