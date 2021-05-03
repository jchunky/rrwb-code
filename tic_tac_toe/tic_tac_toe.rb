class Game < Struct.new(:board)
  NO_MOVE = -1
  UNOCCUPIED = "-"
  ROWS = 3
  COLS = 3

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
    board = self.board.clone
    board[move] = player
    Game.new(board)
  end

  def winner
    COLS.times.each do |i|
      squares = col(i)
      return squares.first if squares.uniq.one? && squares.first != UNOCCUPIED
    end

    ROWS.times.each do |i|
      squares = row(i)
      return squares.first if squares.uniq.one? && squares.first != UNOCCUPIED
    end

    squares = diagonal1
    return squares.first if squares.uniq.one? && squares.first != UNOCCUPIED

    squares = diagonal2
    return squares.first if squares.uniq.one? && squares.first != UNOCCUPIED

    UNOCCUPIED
  end

  def col(i)
    [cell(0, i), cell(1, i), cell(2, i)]
  end

  def row(i)
    [cell(i, 0), cell(i, 1), cell(i, 2)]
  end

  def diagonal1
    [cell(0, 0), cell(1, 1), cell(2, 2)]
  end

  def diagonal2
    [cell(0, 2), cell(1, 1), cell(2, 0)]
  end

  def cell(row, col)
    board[row * 3 + col]
  end
end
