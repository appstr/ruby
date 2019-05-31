require_relative 'flatten.rb'

def quick_sort(arr)
  length = arr.length
  return arr if length <= 1
  left, right = [], []
  pivot = arr[0]
  i = 1
  while i < length
    arr[i] < pivot ? left << arr[i] : right << arr[i]
    i += 1
  end
  flatten([quick_sort(left), pivot, quick_sort(right)])
end

list = (1..10000).to_a.shuffle!
p quick_sort(list)
