# Fun way
class Fesh
  attr_accessor :days
  def initialize init_days
    @days = init_days
  end

  def iterate
    @days -= 1

    if @days < 0
      @days = 6

      return Fesh.new(8)
    end
  end
end

class SchoolOfFesh
  attr_accessor :feshies

  def initialize current_fesh
    @feshies = current_fesh.map { |d| Fesh.new(d) }
  end

  def iterate days
    days.times.each do
      new_feshies = []
      @feshies.each do |f|
        new_fesh = f.iterate

        new_feshies.push(new_fesh) if new_fesh
      end

      @feshies.concat(new_feshies)
    end

    return @feshies.count
  end
end

current_fesh = File.read('day6.input').split(',').map(&:to_i)
school = SchoolOfFesh.new(current_fesh)
fesh_count = school.iterate(80)

puts "Part1: #{fesh_count}"
# BOO HOO fun way doesn't work for part 2
# puts "Part2: #{school.iterate(176)}"

# Smart way
def doodoo init, n
  fesh = Array.new(9, 0)
  init.each { |i| fesh[i] += 1 }

  n.times.each do
    first = fesh.shift
    fesh[6] += first
    fesh.push(first)
  end

  return fesh.reduce(&:+)
end

puts "Part2: #{doodoo(current_fesh, 80)}"
