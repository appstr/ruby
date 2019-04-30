# arr = [
  # [1 1 1 0 0 0],
  # [0 1 0 0 0 0],
  # [1 1 1 0 0 0],
  # [0 0 2 4 4 0],
  # [0 0 0 2 0 0],
  # [0 0 1 2 4 0]
# ]

# arr contains the following hourglasses:

# 1 1 1  1 1 0  1 0 0  0 0 0
#   1      0      0      0
# 1 1 1  1 1 0  1 0 0  0 0 0
#
# 0 1 0  1 0 0  0 0 0  0 0 0
#   1      1      0      0
# 0 0 2  0 2 4  2 4 4  4 4 0
#
# 1 1 1  1 1 0  1 0 0  0 0 0
#   0      2      4      4
# 0 0 0  0 0 2  0 2 0  2 0 0
#
# 0 0 2  0 2 4  2 4 4  4 4 0
#   0      0      2      0
# 0 0 1  0 1 2  1 2 4  2 4 0

# => Maximum hourglass sum = 19

# The hourglass with the maximum sum (19) is in the last row, and the second to last column(3,2):

# 2 4 4
#   2
# 1 2 4

def hourglass_sum(arrays)
  hourglasses = []
  arrays.each_with_index do |arr, arr_indx|
    top_counter = 0
    middle_counter = 1
    bottom_counter = 0
    hourglass = []
    while arrays[arr_indx + 2] != nil and arrays[arr_indx][top_counter + 2] != nil
      hourglass << get_top(arrays[arr_indx], top_counter)
      top_counter += 1
      hourglass << get_middle(arrays[arr_indx + 1], middle_counter)
      middle_counter += 1
      hourglass << get_bottom(arrays[arr_indx + 2], bottom_counter)
      bottom_counter += 1
    end
    hourglasses << hourglass.flatten if !hourglass.empty?
  end
  hourglasses = split_hourglasses(hourglasses)
  highest_sum_for(hourglasses)
end

def highest_sum_for(hourglasses)
  sum = nil
  hourglasses.each do |arr|
    if sum.nil?
      sum = arr.sum
    else
      sum = arr.sum if arr.sum > sum
    end
  end
  sum
end

def split_hourglasses(hourglasses)
  new_hourglasses = []
  hourglasses.each do |arr|
    counter = 0
    hourglass = []
    while counter <= arr.length
      if hourglass.length == 7
        new_hourglasses << hourglass
        hourglass = []
      end
      hourglass << arr[counter]
      counter += 1
    end
  end
  new_hourglasses
end

def get_top(arr, top_counter)
  new_arr = []
  3.times do |indx|
    new_arr << arr[top_counter + indx]
  end
  new_arr
end

def get_middle(arr, middle_counter)
  arr[middle_counter]
end

def get_bottom(arr, bottom_counter)
  new_arr = []
  3.times do |indx|
    new_arr << arr[bottom_counter + indx]
  end
  new_arr
end


# arrays = [[1, 1, 1, 0, 0, 0], [0, 1, 0, 0, 0, 0], [1, 1, 1, 0, 0, 0], [0, 0, 2, 4, 4, 0], [0, 0, 0, 2, 0, 0], [0, 0, 1, 2, 4, 0]]
# => 19

# arrays = [
# [-9, -9, -9, 1, 1, 1],
#  [0, -9,  0, 4, 3, 2],
# [-9, -9, -9, 1, 2, 3],
#  [0,  0,  8, 6, 6, 0],
#  [0,  0,  0, -2, 0, 0],
#  [0,  0,  1, 2, 4, 0]
# ]
# => 28

# arrays = [[1,2,3], [4,5,6], [7,8,9]]
# => 35


arrays = [
  [-1, -1, 0, -9, -2, -2],
  [-2, -1, -6, -8, -2, -5],
  [-1, -1, -1, -2, -3, -4],
  [-1, -9, -2, -4, -4, -5],
  [-7, -3, -3, -2, -9, -9],
  [-1, -3, -1, -2, -4, -5]
]
# => -6

p hourglass_sum(arrays)
