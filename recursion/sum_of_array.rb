# # recursive
# def sum_of_arr(arr)
#   return [] if arr.empty?
#   return arr[0] if arr.length <= 1
#   arr[0] += sum_of_arr(arr[1..(arr.length - 1)])
# end

# # iterative
# def sum_of_arr(arr)
#   sum = 0
#   arr.each {|i| sum += i}
#   sum
# end

p sum_of_arr([1,2,3]) #=> 6
p sum_of_arr([1,2,3,4,5,6]) #=> 21
p sum_of_arr([1,2,3,4,5,6,7,8,9]) #=> 45
