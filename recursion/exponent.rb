def exponent(base, exp)
  return base if exp == 1
  base *= exponent(base, exp - 1)
end

p exponent(3, 7) #=> 2187
