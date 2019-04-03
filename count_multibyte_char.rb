def count_multibyte_char(str)
  counter = 0
  str.each_char do |char|
    count = 0
    char.each_byte do |byte|
      count += 1
    end
    counter += 1 if count > 1
  end
  puts counter
end

str = "¢4000"

count_multibyte_char(str)
