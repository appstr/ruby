def mask_article(str, arry)
  arry.each do |word|
    if str.include? word
      str = str.gsub(word, strike(word))
    end
  end
  str
end

def strike(str)
  "<strike>#{str}</strike>"
end


my_arry = ["Christopher", "Pelnar"]
my_str = "Christopher Pelnar likes to work with Ruby."

puts mask_article(my_str, my_arry)
