class Game
  NO_MOVE = -1
  UNOCCUPIED = "-"
  ROWS = 3
  COLS = 3

  attr_accessor :board

  def initialize(board, position = nil, player = nil)
    @board = board.clone
    @board[position] = player if position
  end

  def best_move_for(player)
    winning_move = nil
    default_move = NO_MOVE
    board.size.times.each do |move|
      next unless occupied?(move)

      game = play(move, player)
      winning_move = move if game.winner == player
      default_move = move
    end
    winning_move || default_move
  end

  def occupied?(move)
    board[move] == UNOCCUPIED
  end

  def play(move, player)
    Game.new(board, move, player)
  end

  def winner
    COLS.times.each do |col|
      squares = [board[col], board[col + 3], board[col + 6]]
      return squares.first if squares.uniq.one? && squares.first != UNOCCUPIED
    end

    ROWS.times.each do |row|
      squares = [board[row * 3], board[row * 3 + 1], board[row * 3 + 2]]
      return squares.first if squares.uniq.one? && squares.first != UNOCCUPIED
    end

    squares = [board[0], board[4], board[8]]
    return squares.first if squares.uniq.one? && squares.first != UNOCCUPIED

    squares = [board[2], board[4], board[6]]
    return squares.first if squares.uniq.one? && squares.first != UNOCCUPIED

    UNOCCUPIED
  end
end
