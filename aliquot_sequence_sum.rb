# Find the aliquot sequence sum of a base number.
# Ex:
# 10 = base
# The aliquot sequence of 10 == the factorials of 10. [1,2,5,10]
# The sum of those factorials is the numbers aliquot sum. [1+2+5] = 8
# 8 now becomes the base. The process repeats.

def aliquot_sequence(base, n)
  sequence = []
  while base > 1
    base = aliquot_sum(base)
    sequence << base
    break if sequence.length == n
  end
  sequence
end

def aliquot_sum(base)
  factorials_of_base = Array.new(1, 1)
  counter = base - (base / 2)
  while counter > 1
    factorials_of_base << counter if base % counter == 0
    counter -= 1
  end
  factorials_of_base.sum
end


base = 100
n = 4
print aliquot_sequence(base, n)
