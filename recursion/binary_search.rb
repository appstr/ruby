def binary_search(arr, target)
  return arr[0] if arr[0] == target
  length = arr.length
  mid = (length / 2)
  if arr[mid] > target
    binary_search(arr.slice(0, mid), target)
  elsif arr[mid] < target
    binary_search(arr.slice(mid, length), target)
  else
    return "FOUND #{target}"
  end
end

arr = (1..100000).to_a
p binary_search(arr, 5320)
