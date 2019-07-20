# def insertion_sort(list)
#   i = 1
#   j = 0
#   while i < list.length
#     if j < i
#       if list[i] < list[j]
#         list.insert(j, list[i])
#         list.delete_at(i+1)
#         current = j
#         while list[current] < list[current - 1] && current - 1 >= 0
#           list.insert(current-1, list[current])
#           list.delete_at(current+1)
#           current -= 1
#         end
#       end
#       j+=1
#     end
#     i+=1
#   end
#   list
# end

def insertion_sort(arr, &prc)
  dir = (prc.call(1,2) == -1) ? :ASC : :DESC
  while true
    i = 0
    j = 1
    inserted = false
    while j < arr.length
      if dir == :ASC
        if arr[i] > arr[j]
          num = arr.delete_at(i)
          arr.insert(j, num)
          inserted = true
        end
      else
        if arr[i] < arr[j]
          num = arr.delete_at(i)
          arr.insert(j, num)
          inserted = true
        end
      end
      i += 1
      j += 1
    end
    break if !inserted
  end
  arr
end

list = (1..100).to_a.shuffle
print insertion_sort(list){|a,b| b<=>a}
