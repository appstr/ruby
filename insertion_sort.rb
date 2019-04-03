def insertion_sort(list)
  i = 1
  j = 0
  while i < list.length
    if j < i
      if list[i] < list[j]
        list.insert(j, list[i])
        list.delete_at(i+1)
        current = j
        while list[current] < list[current - 1] && current - 1 >= 0
          list.insert(current-1, list[current])
          list.delete_at(current+1)
          current -= 1
        end
      end
      j+=1
    end
    i+=1
  end
  list
end

list = [6,4,8,3,7,2,9,10,5,1]
print insertion_sort(list)

list = [1,3,2,5,4,6,8,7,9,10]
print insertion_sort(list)
