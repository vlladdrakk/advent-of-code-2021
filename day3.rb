arr = []
total = File.readlines('day3.input').count

File.readlines('day3.input').each do |line|
  chars = line.chomp.split('')
  chars.each_with_index do |v, i|
    arr[i] ||= 0
    arr[i] += 1 if v.to_i == 1
  end
end

most_sig_bits = []

arr.each_with_index do |val, index|
  most_sig_bits[index] = val >= (total/2) ? 1 : 0
end
gamma = most_sig_bits.join.to_i(2)
epsilon = most_sig_bits.map { |x| x == 1 ? 0 : 1 }.join.to_i(2)

puts "Part 1 answer: #{gamma * epsilon}"


# PART 2
def find_most_frequent_bit(list, position)
  memo = { zeroes: 0, ones: 0 }
  list.each do |bin_number|
    (bin_number[position]).zero? ? memo[:zeroes] += 1 : memo[:ones] += 1
  end
  memo[:ones] >= memo[:zeroes] ? 1 : 0
end

def find_least_frequent_bit(list, position)
  memo = { zeroes: 0, ones: 0 }
  list.each do |bin_number|
    (bin_number[position]).zero? ? memo[:zeroes] += 1 : memo[:ones] += 1
  end
  memo[:ones] < memo[:zeroes] ? 1 : 0
end

def get_number list, i, most_significant = true
  return list.first if list.length == 1

  if most_significant
    bit = find_most_frequent_bit(list, i)
  else
    bit = find_least_frequent_bit(list, i)
  end

  new_list = list.filter { |x| x[i] == bit }

  get_number(new_list, i + 1, most_significant)
end

input = File.readlines('day3.input').map { |x| x.chomp.split('').map(&:to_i) }

oxy_rating = get_number(input, 0).join.to_i(2)
c02_rating = get_number(input, 0, false).join.to_i(2)

puts "Part 2 answer: #{oxy_rating * c02_rating}"
