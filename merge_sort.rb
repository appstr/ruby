def merge_sort(list)
  leng = list.length
  return list if leng <= 1
  mid = leng / 2
  left = list.slice(0, mid)
  right = list.slice(mid, leng)
  sorted_left = merge_sort(left)
  sorted_right = merge_sort(right)
  stitch(sorted_left, sorted_right)
end

def stitch(left, right)
  results = []

  while !left.empty? && !right.empty? do
    if left[0] <= right[0]
      results << left.shift
    else
      results << right.shift
    end
  end

  while !left.empty? do
    results << left.shift
  end

  while !right.empty? do
    results << right.shift
  end

  results

end

list = [6,4,8,3,7,2,9,10,5,1]

print merge_sort(list)
