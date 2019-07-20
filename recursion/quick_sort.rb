require_relative 'flatten.rb'

def quick_sort(arr, &prc)
  length = arr.length
  return arr if length <= 1
  left, right = [], []
  pivot = arr[0]
  i = 1
  while i < length
    prc.call(arr[i], pivot) == -1 ? left << arr[i] : right << arr[i]
    i += 1
  end
  quick_sort(left, &prc) + [pivot] + quick_sort(right, &prc)
end

list = (1..100000).to_a.shuffle
p quick_sort(list){|a,b| b<=>a}
