def process_text(arry)
  new_array = []
  arry.each do |str|
    new_array << str.strip
  end
  new_array.join(" ")
end


my_array = ["Hi, \n", " Are you having fun?    "]
puts process_text(my_array)
