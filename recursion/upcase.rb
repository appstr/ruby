def upcase(str)
  if str.length == 1
    if (97..122).include? str.ord
      return (str.ord - 32).chr
    elsif (65..90).include? str.ord
      return (str.ord).chr
    else
      return str
    end
  end
  upcase(str[0]) + upcase(str[1...str.length])
end

p upcase("hello world") # => "HELLO WORLD"
p upcase("HELLO WORLD") # => "HELLO WORLD"
