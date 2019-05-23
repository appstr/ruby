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

list = [6,4,8,3,7,2,9,10,5,1]
p quick_sort(list)
