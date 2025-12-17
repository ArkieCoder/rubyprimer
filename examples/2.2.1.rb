bell = Object.new
def bell.ring
  puts "ring"
end

# add a loop inside this method to ring the bell 'n' times
def ring(bell, n)
  bell.ring
end

ring(bell, 3)
