horizontal = 0
vertical = 0
aim = 0
depth = 0

File.readlines('day2.input').each do |line|
  direction, magnitude = line.split(' ')
  magnitude = magnitude.to_i

  if direction == 'forward'
    horizontal += magnitude
    depth += aim * magnitude
  end

  if direction == 'down'
    vertical += magnitude
    aim += magnitude
  end

  if direction == 'up'
    vertical -= magnitude
    aim -= magnitude
  end;
end

puts "Horizontal: #{horizontal}"
puts "Vertical: #{vertical}"
puts "Depth: #{depth}"

puts "Part 1 answer: #{horizontal * vertical}"

puts "Part 2 answer: #{depth * horizontal}"
