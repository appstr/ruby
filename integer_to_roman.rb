NUMERALS = {1=>'I', 5=>'V', 10=>'X', 50=>'L', 100=>'C', 500=>'D', 1000=>'M'}
EXCEPTIONS = {4=>'IV', 9=>'IX', 40=>'XL', 90=>'XC', 400=>'CD', 900=>'CM'}
VALUES = [1, 10, 100, 1000]

def int_to_roman(number)
  nums = number.to_s.split("")
  roman = []
  nums.reverse_each.with_index do |num, indx|
    roman.unshift(get_numeral(num.to_i, VALUES[indx]))
  end
  roman.join("")
end

def get_numeral(num, value)
  num *= value
  return NUMERALS[num] if NUMERALS[num]
  return EXCEPTIONS[num] if EXCEPTIONS[num]
  if value == 1
    return get_ones(num, value)
  elsif value == 10
    return get_tens(num, value)
  elsif value == 100
    get_hundreds(num, value)
  elsif value == 1000
    get_thousands(num, value)
  end
end

def get_ones(num, value)
  if num < 5
    return "I" * num
  elsif num >= 5 and num < 10
    roman = "V"
    diff = num - 5
    diff.times do
      roman += "I"
    end
    return roman
  end
end

def get_tens(num, value)
  if num < 50
    return "X" * (num / value)
  elsif num >= 50
    roman = "L"
    diff = (num - 50) / value
    diff.times do
      roman += "X"
    end
    return roman
  end
end

def get_hundreds(num, value)
  if num < 500
    return "C" * (num / value)
  elsif num >= 500 and num < 1000
    roman = "D"
    diff = (num - 500) / value
    diff.times do
      roman += "C"
    end
    return roman
  end
end

def get_thousands(num, value)
  roman = ""
  num /= value
  num.times do
    roman += "M"
  end
  return roman
end
