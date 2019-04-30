# Does your magazine have enough letters in it to send a ransom note?

# def ransom_note(mag, note)
#   mag = mag.split("")
#   note = note.split("")
#   note_len = note.length
#   note_counter = 0
#   while note_counter < note_len
#     mag_counter = 0
#     mag_len = mag.length
#     found = false
#     while mag_counter < mag_len
#       if mag[mag_counter] == note[note_counter]
#         found = true
#         mag.delete_at(mag_counter)
#         break
#       end
#       mag_counter += 1
#     end
#     if found == false
#       not_found = true
#       break
#     end
#     note_counter += 1
#   end
#   not_found ? "No" : "Yes"
# end

# def ransom_note(magazine, note)
#     # return false if note.length > magazine.length
#     note_hash = Hash.new(0)
#     magazine_hash = Hash.new(0)
#     note.each do |word|
#         note_hash[word] += 1
#     end
#     magazine.each do |word|
#         magazine_hash[word] += 1
#     end
#     can_use = true
#     note_hash.each_pair do |k, v|
#         if magazine_hash[k].nil? or note_hash[k] > magazine_hash[k]
#             can_use = false
#             break
#         end
#     end
#     if can_use
#         print "Yes"
#     else
#         print "No"
#     end
# end


# puts ransom_note("give me one grand today night", "give one grand today") # => Yes
# puts ransom_note("two times three is not four", "two times two is four") # => No
# puts ransom_note("ive got a lovely bunch of coconuts", "ive got some coconuts") # => No

ransom_note("o l x imjaw bee khmla v o v o imjaw l khmla imjaw x".split(" "), "imjaw l khmla x imjaw o l l o khmla v bee o o imjaw imjaw o".split(" "))
puts

# o l x imjaw bee khmla v o v o imjaw l khmla imjaw x
# imjaw l khmla x imjaw o l l o khmla v bee o o imjaw imjaw o
