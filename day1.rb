current = nil
previous = nil
increases = 0

File.readlines('day1.input').each do |line|
  current = line.to_i
  increases += 1 if previous && current > previous

  previous = current
end

puts "Problem 1: #{increases}"

window = []
current = nil
previous = nil
increases = 0

File.readlines('day1.input').each do |line|
  window.push(line.to_i)
  next if window.count < 3

  current = window.last(3).reduce(&:+)

  if previous && current > previous
    increases += 1
  end

  previous = current
end

puts "Problem 2: #{increases}"
