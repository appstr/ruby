# Create an array that rotates characters left `d` amount of index places.
# Examples:
# rotate([1, 2, 3, 4, 5, 6], 16) => [5, 6, 1, 2, 3, 4]
# rotate([1, 2, 3, 4, 5], 4) => [5, 1, 2, 3, 4]
# rotate([1, 2, 3, 4, 5], 17) => [3, 4, 5, 1, 2]
# rotate([1, 2, 3, 4, 5, 6], 4) => [5, 6, 1, 2, 3, 4]
# rotate([1, 2, 3, 4, 5], 18) => [4, 5, 1, 2, 3]
# rotate([1, 2, 3, 4, 5, 6, 7], 4) => [5, 6, 7, 1, 2, 3, 4]
# rotate([1, 2, 3, 4, 5], 6) => [2, 3, 4, 5, 1]
# rotate([1, 2, 3], 2) => [3, 1, 2]
# rotate([1, 2, 3, 4, 5], 7) => [3, 4, 5, 1, 2]
# rotate([1, 2, 3, 4, 5, 6, 7], 2) => [3, 4, 5, 6, 7, 1, 2]
# rotate([1, 2, 3, 4, 5], 8) => [4, 5, 1, 2, 3]


def rotate(arr, d)
  len = arr.length
  new_arr = []
  counter = 0

  if len > d
    diff = len - d
    neg = -(diff)
    while neg < 0
      new_arr << arr[neg]
      neg += 1
    end

    while counter < d
      new_arr << arr[counter]
      counter += 1
    end

  elsif len < d
    diff = d % len
    front = -(len - diff)
    while front < 0
      new_arr << arr[front]
      front += 1
    end
    while counter < diff
      new_arr << arr[counter]
      counter += 1
    end

  else
    new_arr = arr
  end

  new_arr
end

print rotate([1, 2, 3, 4, 5, 6, 7], 4)
