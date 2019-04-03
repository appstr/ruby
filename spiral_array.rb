def spiral_array(num)
  @array = Array.new(num) {Array.new(num)}
  @array.each {|arr| arr.fill {|i| i}}
  @counter = 1
  @first_index, @second_index = 0, 0
  @taken_spots = []
  limit = num*num
   while @counter <= limit
     move('right')
     @first_index += 1
     move('down')
     @second_index -= 1
     move('left')
     @first_index -= 1
     move('up')
     @second_index += 1
   end
  display(@array)
end

def move(direction)
  begin
    while !@array[@first_index][@second_index].nil? && !@taken_spots.include?("#{@first_index}#{@second_index}") && @first_index >= 0 && @second_index >= 0
      @taken_spots << "#{@first_index}#{@second_index}"
      @array[@first_index][@second_index] = @counter
      @second_index += 1 if direction == 'right'
      @first_index += 1 if direction == 'down'
      @second_index -= 1 if direction == "left"
      @first_index -= 1 if direction == "up"
      @counter += 1
    end
    @second_index -= 1 if direction == 'right'
    @first_index -= 1 if direction == 'down'
    @second_index += 1 if direction == "left"
    @first_index += 1 if direction == "up"
  rescue NoMethodError => e
    @second_index -= 1 if direction == 'right'
    @first_index -= 1 if direction == 'down'
    @second_index += 1 if direction == "left"
    @first_index += 1 if direction == "up"
  end
end

def display(array)
  array.each do |block|
    puts block.each { |chr| chr }.join(" ")
  end
end

spiral_array(8)
