# Count who is responsible for transmitting the virus most from the 'Original Carrier', even through spreads by its children.

# Constant 'I' is patient-0, the 'Original Carrier' of the virus.

# The argument variable 'spread' represents who spread the virus to who.
# spread[0][0] transmitted to spread[0][1]
# spread[1][0] transmitted to spread[1][1]
# spread[2][0] transmitted to spread[2][1]
# etc...

# Example: spread = [['I', 'A'], ['I', 'B'], ['A', 'X'], ['B', 'C'], ['C', 'D'], ['A', 'F'], ['A', 'Z'], ['X', 'Y'], ['D', 'L'], ['Y', 'J']]
# Explanation: "I" spread to "A", "A" spread to "X", "F", and "Z" directly. The children of "A" spread to "Y" and "J".

# Which letter is NOT the 'Original Carrier'("I"), and transmits the virus most to others through direct contact and children tranmissions?

# The answer is 'A' since it has the most overall transmissions.

# You can assume the virus will be spread in chronological order where
# children must first be infected before they are able to spead the virus.

I = "I"

def who_spread_the_virus_most?(virus_spread)
  direct_descendants = []
  # Example: ["A", "B"]
  descendant_spread = []
  # [["A", "X"], ["B", "C"], ["C", "D"], ["A", "F"], ["A", "Z"], ["X", "Y"], ["D", "L"], ["Y", "J"]]
  descendant_tracking = [{}]
  # [{'A' => ['X', 'F', 'Z', 'Y', 'J'], 'B' => ['C', 'D', 'L']}]
  virus_spread.each do |k, v|
    k == I ? direct_descendants << v : descendant_spread << [k, v]
  end

  direct_descendants.each do |dt|
    descendant_tracking[0][dt] = []
  end

  descendant_spread.each do |k, v|
    if direct_descendants.include? k
      descendant_tracking[0][k] << v
    else
      descendant_tracking[0].each do |k1, v1|
        descendant_tracking[0][k1] << v  if v1.include? k
      end
    end
  end

  hash_length = descendant_tracking[0].length
  largest = ""
  largest_length = 0

  descendant_tracking[0].each do |k, v|
    if v.length > largest_length
      largest = k
      largest_length = v.length
    end
  end
  largest
end

virus_spread = [['I', 'A'], ['I', 'B'], ['A', 'X'], ['B', 'C'], ['C', 'D'], ['A', 'F'], ['A', 'Z'], ['X', 'Y'], ['D', 'L'], ['Y', 'J']]
puts who_spread_the_virus_most?(virus_spread)
