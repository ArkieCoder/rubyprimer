def check_sign(number)
  if number > 0
    "#{number} is positive"
  else
    "#{number} is negative"
  end        
end
puts check_sign(-1)
puts check_sign(0)
puts check_sign(1)
