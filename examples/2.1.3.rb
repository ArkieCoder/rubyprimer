def check_sign(number)
  number > 0 ? "#{number} is positive" : "#{number} is negative"
end
puts check_sign(-1)
puts check_sign(0)
puts check_sign(1)
