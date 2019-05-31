def add_numbers(arr)
  return nil if arr.empty?
  return arr[0] if arr.length == 1
  arr[0] += add_numbers(arr[1..(arr.length - 1)])
end

p add_numbers([1,2,3,4]) # => returns 10
p add_numbers([3]) # => returns 3
p add_numbers([-80,34,7]) # => returns -39
p add_numbers([]) # => returns nil
