data = File.readlines('day5.input')
lines = []

class Point
  attr_accessor :x
  attr_accessor :y

  def initialize data
    @x = data.first
    @y = data.last
  end

  def equals p
    return p.x == @x && p.y == @y
  end

  def to_s
    "[#{@x}, #{y}]"
  end
end


data.each do |line|
  a, b = line.split(' -> ')
  a = a.split(',').map(&:to_i)
  b = b.split(',').map(&:to_i)

  lines.push([a, b])
end

def execute lines, part1: false
  max_x = lines.reduce(0) { |a,x| [a, x[0][0], x[1][0]].max }
  max_y = lines.reduce(0) { |a,x| [a, x[0][1], x[1][1]].max }
  plane = Array.new(max_y + 1) { Array.new(max_x + 1, 0) }
  # Filter for horizontal and vertical lines
  lines = lines.filter { |l| l[0][0] == l[1][0] || l[0][1] == l[1][1] } if part1
  lines.each do |line|
    p1 = Point.new(line.first)
    p2 = Point.new(line.last)
    dx = p1.x == p2.x ? 0 : (p1.x < p2.x ? 1 : -1)
    dy = p1.y == p2.y ? 0 : (p1.y < p2.y ? 1 : -1)

    current = Point.new(line.first)

    until current.equals(p2)
      plane[current.y][current.x] += 1
      current.x += dx
      current.y += dy
    end

    plane[current.y][current.x] += 1
  end

  return plane.flatten.reduce { |a, x| x >= 2 ? a + 1 : a }
end

puts "Part 1: #{execute(lines, part1: true)}"
puts "Part 2: #{execute(lines)}"
