def one_edit_away(word_1, word_2)
  return true if word_1.include?(word_2) || word_2.include?(word_1)
  offset = 0
  w1_split = word_1.split("")
  w2_split = word_2.split("")
  w1_split.each_with_index do |char, indx_i|
    offset += 1 if word_1[indx_i] != word_2[indx_i]
    return false if offset == 2
  end
  true
end

word_1 = "cat"
word_2 = "act"

puts one_edit_away(word_1, word_2)
