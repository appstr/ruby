def merge_sort(arr)
  length = arr.length
  return arr if length <= 1
  mid = length / 2
  left = arr.slice(0, mid)
  right = arr.slice(mid, length)
  left_sorted = merge_sort(left)
  right_sorted = merge_sort(right)
  stitch(left_sorted, right_sorted)
end

def stitch(left, right)
  result = []
  while !left.empty? and !right.empty?
    if left[0] < right[0]
      result << left.shift
    else
      result << right.shift
    end
  end

  while !left.empty?
    result << left.shift
  end

  while !right.empty?
    result << right.shift
  end

  result
end


list = [6,4,8,3,7,2,9,10,5,1]
p merge_sort(list)
