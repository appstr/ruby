# Given two strings, determine if they share a common substring. A substring may be as small as one character.

# For example, the words "cat", "band", "art" share the common substring "a". The words "be" and "cat" do not share a substring.

#  It should return a string, either YES or NO based on whether the strings share a common substring.

def two_strings(s1, s2)
  s1 = s1.split("")
  s2 = s2.split("")
  found = false
  s1.each do |s_1|
    s2.each do |s_2|
      if s_1.downcase == s_2.downcase
        found = true
        break
      end
    end
    break if found == true
  end
  found == true ? "Yes" : "No"
end

puts two_strings("Band", "Art")
puts two_strings("Cat", "Be")
