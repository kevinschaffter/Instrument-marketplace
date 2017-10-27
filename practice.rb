height = ARGV[0]
output = ""
height.times do |i|
  output << "*" * i
  output << "\n"
end
puts output