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
