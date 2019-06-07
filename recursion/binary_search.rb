def binary_search(arr, target)
  return arr[0] if arr[0] == target
  return nil if arr.length <= 1
  length = arr.length
  mid = length / 2
  if arr[mid] > target
    arr = arr.slice(0, mid)
    binary_search(arr, target)
  else
    arr = arr.slice(mid, length)
    binary_search(arr, target)
  end
end

arr = (1..100000).to_a
p binary_search(arr, 5320)
