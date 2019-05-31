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

list = (1..10000).to_a.shuffle!
print insertion_sort(list)
