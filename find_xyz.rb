#  xx
# +yy
# +zz
# ---
# xyz

# What is 'z'?

def find_xyz
  x = 0
  y = 0
  z = 0

  while x.to_s.length <= 2
    while y.to_s.length <= 2
      while z.to_s.length <= 2
        puts "X: #{x}, Y:#{y}, Z:#{z}"
        if x.to_i + y.to_i + z.to_i == "#{x.to_s[0]}#{y.to_s[0]}#{z.to_s[0]}".to_i and x.to_i + y.to_i + z.to_i != 0
          return "#{x.to_s[0]}#{y.to_s[0]}#{z.to_s[0]}".to_i
        end
        z += 11
      end
      z = 11
      y += 11
    end
    y = 11
    x += 11
  end
end


p find_xyz

# => 198
# 'z' = 8
# 11 + 99 + 88 = 198
