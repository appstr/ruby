def binary_search(arr, target)
  return nil if arr.empty?
  length = arr.length
  mid = length / 2
  if arr[mid] == target
    return mid
  elsif arr[mid] > target
    left = arr.slice(0, mid)
    binary_search(left, target)
  else
    right = arr.slice(mid+1, length)
    search_res = binary_search(right, target)
    search_res.nil? ? nil : search_res+mid+1
  end
end

arr = (1..100000).to_a
p binary_search(arr, 5320)
