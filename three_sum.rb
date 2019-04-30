require 'byebug'

def three_sum(nums)
  count_a = 0
  count_b = 1
  solutions = []

  while count_a < nums.length - 1
    while count_b < nums.length
      count_c = count_b + 1
      while count_c < nums.length
        if [nums[count_a], nums[count_b], nums[count_c]].sum == 0 and uneek([nums[count_a], nums[count_b], nums[count_c]], solutions)
          solutions << [nums[count_a], nums[count_b], nums[count_c]]
        end
        count_c += 1
      end
      count_b += 1
      if count_b == nums.length
        count_a += 1
        count_b = count_a + 1
      end
    end
  end
  solutions
end

def uneek(arr, solutions)
  solutions.each do |s_arr|
    return false if s_arr.sort == arr.sort
  end
  true
end

# nums = [-1, 0, 1, 2, -1, -4]
nums = [10, 10, -20, 1, 0, -1] # => [[10, 10, -20], [1, 0 , -1]]
p three_sum(nums)
