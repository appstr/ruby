def factorial(num)
  return num if num <= 1
  num *= factorial(num-1)
end

num = 10
puts factorial(num)
