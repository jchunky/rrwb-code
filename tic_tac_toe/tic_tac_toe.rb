class Game
  attr_accessor :board

  def initialize(board, position = nil, player = nil)
    @board = board.clone
    @board[position] = player if position
  end

  def move(player)
    find_winning_position(player) || board.index("-") || -1
  end

  def winner
    3.times.each do |i|
      win = winner_at_location(col(i))
      return win if win
    end
    3.times.each do |i|
      win = winner_at_location(row(i))
      return win if win
    end

    "-"
  end

  private

  def winner_at_location(squares)
    squares.uniq.one? && squares.first != "-" && squares.first
  end

  def col(i)
    [board[i], board[i + 3], board[i + 6]]
  end

  def row(i)
    board.chars[i * 3, 3]
  end

  def find_winning_position(player)
    board.chars.each_with_index do |square, i|
      next unless square == "-"

      game = play(i, player)
      return i if game.winner == player
    end
    nil
  end

  def play(i, player)
    Game.new(board, i, player)
  end
end
