def quick_sort(list)
  leng = list.length
  return list if leng <= 1
  pivot = list[leng-1]
  left, right = [], []
  i = 0
  while i < leng - 1
    list[i] < pivot ? left << list[i] : right << list[i]
    i+=1
  end
  [quick_sort(left), pivot, quick_sort(right)].flatten
end


list = [6,4,8,3,7,2,9,10,5,1]

print quick_sort(list)
