def phone_combinations
    alphabet = ('a'..'z').to_a
    phone_hash = {}
    counter = 0
    (2..9).each do |num|
        phone_hash[num] = []
        if num != 7 and num != 9
            3.times do
                phone_hash[num] << alphabet[counter]
                counter += 1
            end
        else
            4.times do
                phone_hash[num] << alphabet[counter]
                counter += 1
            end
        end
    end
    p phone_hash
end

phone_combinations
