require 'prettyprint'
file = File.open('day4.input')

call_numbers = file.readline().chomp.split(',').map(&:to_i)

boards = []
current_board = []

while line = file.readline()
  if line == "\n" && !current_board.empty?
    boards.push(current_board)
    current_board = []
    next
  end

  current_board.push(line.split(' ').map { |x| x.to_i })

  break if file.eof?
end

def check_board board
  row_victory = board.any? do |row|
    row.all? { |x| x == true}
  end

  col_victory = board.transpose.any? do |col|
    col.all? { |x| x == true }
  end

  return col_victory || row_victory
end

def get_score board, number
  score = board.flatten.filter { |x| x.is_a?(Integer) }.reduce(&:+)
  return score * number
end

last_winner = nil

call_numbers.each do |number|
  boards = boards.map { |board|
    board.flatten.map { |x| x == number ? true : x }.each_slice(5).to_a
  }

  boards.each_with_index do |board, index|
    next unless check_board(board)

    if last_winner == nil
      score = get_score(board, number)
      puts "Answer for part 1: #{score}"
    end

    last_winner = get_score(board, number)
    boards.delete_at(index)
  end
end

puts "Answer for part 2: #{last_winner}"
