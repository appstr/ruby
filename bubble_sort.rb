def bubble_sort(list)
  list.each_index do |index_i|
    list.each_index do |index_j|
      if list[index_i] < list[index_j]
        tmp = list[index_i]
        list[index_i] = list[index_j]
        list[index_j] = tmp
      end
    end
  end
  return list
end

list = [6,4,8,3,7,2,9,10,5,1]
print bubble_sort(list)
