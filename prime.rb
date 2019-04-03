def prime?(suspect_num)
    (2..(suspect_num)).each do |num|
        if suspect_num / 2 <= num
            return true
        elsif suspect_num % num == 0
            return false
        end
    end
    return false
end

puts prime?(24)
