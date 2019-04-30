def move_five(arr)
  counter = 0
  five_count = 0
  while counter < arr.length
    if arr[counter] == 5
      arr = arr[0...counter] + arr[(counter + 1)...arr.length]
      five_count += 1
      counter -= 1
    end
    counter += 1
  end
  five_count.times do
    arr << 5
  end
  arr
end


p move_five([1,2,5,4,4,5,5,6,7,9,11])
