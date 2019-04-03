string = "HELLO WORLD MY NAME IS CHRISTOPHER AND I LIKE TO COUNT LETTERS"

def count_letters(str)
  hash = Hash.new(0)
  arry = str.split('')
  arry.each { |letter| hash[letter] += 1 if letter != " "}
  hash
end

puts count_letters(string)
