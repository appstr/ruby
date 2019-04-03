def case_statement(class_obj)
  case
    when class_obj == String
      puts "FOUND STRING!!"
    when class_obj == Integer
      puts "FOUND INTEGER!!"
    else
      puts "FOUND NOTHING!!"
  end
end



class_obj = 10.class
case_statement(class_obj)

class_obj = "10".class
case_statement(class_obj)
