# Does your magazine have enough letters in it to send a ransom note?

def ransom_note(mag, note)
  mag = mag.split("")
  note = note.split("")
  note_len = note.length
  note_counter = 0
  while note_counter < note_len
    mag_counter = 0
    mag_len = mag.length
    found = false
    while mag_counter < mag_len
      if mag[mag_counter] == note[note_counter]
        found = true
        mag.delete_at(mag_counter)
        break
      end
      mag_counter += 1
    end
    if found == false
      not_found = true
      break
    end
    note_counter += 1
  end
  not_found ? "No" : "Yes"
end


puts ransom_note("give me one grand today night", "give one grand today") # => Yes
puts ransom_note("two times three is not four", "two times two is four") # => No
puts ransom_note("ive got a lovely bunch of coconuts", "ive got some coconuts") # => No
