monk = Object.new
def monk.nirvana?
  @count ||= 0
  @count += 1
  @count > 3
end

def monk.meditate
  puts "meditating"
end

# you have to change the following statement (into multiple ones if needed)
# so that the monk meditates till monk.nirvana? becomes true.
monk.meditate unless monk.nirvana?
