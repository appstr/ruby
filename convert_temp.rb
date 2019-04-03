def convert_temp(temperature, input_scale: "fahrenheit", output_scale: "celsius")
    temp = temperature
    input = input_scale
    output = output_scale

    if input == "fahrenheit" and output == "celsius"
      return f_c(temp)
    elsif input == "celsius" and output == "fahrenheit"
      return c_f(temp)
    elsif input == "fahrenheit" and output == "kelvin"
      return f_k(temp)
    elsif input == "kelvin" and output == "fahrenheit"
      return k_f(temp)
    elsif input == "celsius" and output == "kelvin"
      return c_k(temp)
    elsif input == "kelvin" and output == "celsius"
      return k_c(temp)
    end
end

def f_c(f)
  5.0 / 9.0 * (f - 32.0)
end

def c_f(c)
  (9.0 / 5.0) * c + 32.0
end

def f_k(f)
  c = f_c(f)
  c + 273.0
end

def k_f(k)
  k * 9.0 / 5.0 - 459.67
end

def c_k(c)
  c + 273.0
end

def k_c(k)
  k - 273.0
end


puts convert_temp(0, input_scale: "fahrenheit", output_scale: "celsius")
puts convert_temp(0, input_scale: "celsius", output_scale: "fahrenheit")
puts convert_temp(0, input_scale: "fahrenheit", output_scale: "kelvin")
puts convert_temp(0, input_scale: "kelvin", output_scale: "fahrenheit")
puts convert_temp(0, input_scale: "celsius", output_scale: "kelvin")
puts convert_temp(0, input_scale: "kelvin", output_scale: "celsius")
