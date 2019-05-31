def bubble_sort(arr, &prc)
  length = arr.length
  while true
    swapped = false
    (length - 1).times do |i|
      if prc.call(arr[i], arr[i + 1]) == 1
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
        swapped = true
      end
    end
    break if !swapped
  end
  arr
end

list = (1..10000).to_a.shuffle!
print bubble_sort(list) {|x, y| x <=> y}
