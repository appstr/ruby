def gamma_fnc(num)
  return nil if num <= 0
  return 1 if num <= 1
  num -= 1
  num *= gamma_fnc(num)
end


p gamma_fnc(0)  # => returns nil
p gamma_fnc(1)  # => returns 1
p gamma_fnc(4)  # => returns 6
p gamma_fnc(8)  # => returns 5040
