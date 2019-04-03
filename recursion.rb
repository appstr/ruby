def factorial(num)
  return 1 if num == 1
  return num * factorial(num - 1)
end

num = 5

puts factorial(num)


def fibonacci(num)
  return num if num <= 1
  fibonacci(num-1) + fibonacci(num-2)
end

num = 10
counter = 0

while counter <= num
  puts fibonacci(counter)
  counter += 1
end
