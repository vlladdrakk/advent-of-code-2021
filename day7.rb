inputs = File.read('day7.input').split(',').map &:to_i

def get_median input
  sorted = input.sort
  idx = sorted.length / 2
  median = sorted[idx]

  median = sorted[idx-1, 2].sum / 2.0 if sorted.length.even?

  return median
end

def get_fuel_cost_part1 median, input
  total_fuel = 0

  input.each { |x| total_fuel += (median - x).abs }

  return total_fuel
end

def get_fuel_cost_part2 input
  min_fuel = []

  (0..input.max).each do |pos|
    fuel = 0

    input.each do |i|
      n = (i - pos).abs
      fuel += n * (n + 1) / 2.0
    end

    min_fuel.push(fuel)
  end

  return min_fuel.min
end

median = get_median(inputs)
fuel_cost = get_fuel_cost_part1(median, inputs)

puts "Part 1: #{fuel_cost}"
puts "Part 2: #{get_fuel_cost_part2(inputs)}"
