# recursive solution
require_relative 'flatten.rb'

def range(start, fin)
  return [] if fin < start
  return fin-1 if start == fin-1
  flatten([start] << range(start+1, fin))
end

# iterative solution - faster, and more efficient at scale.

# def range(start, fin)
#   result = []
#   while start < fin
#     result << start
#     start += 1
#   end
#   result
# end

p range(1, 5) #=> [1, 2, 3, 4]
p range(10, 15) #=> [10, 11, 12, 13, 14]
p range(21, 25) #=> [21, 22, 23, 24]
p range(0, 10) #=> [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
