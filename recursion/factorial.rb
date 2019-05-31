def factorial(num)
  return 1 if num == 1
  return num * factorial(num - 1)
end

num = 5
puts factorial(num)
