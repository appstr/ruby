def flavor_match(arr, flavor)
  return true if arr[0] == flavor
  return false if arr.empty?
  flavor_match(arr[1..(arr.length-1)], flavor)
end


p flavor_match(['vanilla', 'strawberry'], 'blue moon')  # => returns false
p flavor_match(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')  # => returns true
p flavor_match(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')  # => returns false
p flavor_match(['moose tracks'], 'moose tracks')  # => returns true
p flavor_match([], 'honey lavender')  # => returns false
