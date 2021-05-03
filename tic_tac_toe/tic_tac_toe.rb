class Game < Struct.new(:board)
  NO_MOVE = -1
  UNOCCUPIED = "-"
  ROWS = 3
  COLS = 3

  def best_move_for(player)
    winning_move = nil
    default_move = NO_MOVE
    board.size.times.each do |move|
      next if occupied?(move)

      game = play(move, player)
      winning_move = move if game.winner == player
      default_move = move
    end
    winning_move || default_move
  end

  def winner
    positions.each do |cells|
      return cells.first if cells.first != UNOCCUPIED && cells.uniq.one?
    end

    UNOCCUPIED
  end

  private

  def occupied?(move)
    board[move] != UNOCCUPIED
  end

  def play(move, player)
    board = self.board.clone
    board[move] = player
    Game.new(board)
  end

  def positions
    [diagonal1, diagonal2] +
      COLS.times.map { |i| col(i) } +
      ROWS.times.map { |i| row(i) }
  end

  def diagonal1
    [cell(0, 0), cell(1, 1), cell(2, 2)]
  end

  def diagonal2
    [cell(0, 2), cell(1, 1), cell(2, 0)]
  end

  def row(i)
    [cell(i, 0), cell(i, 1), cell(i, 2)]
  end

  def col(i)
    [cell(0, i), cell(1, i), cell(2, i)]
  end

  def cell(row, col)
    board[row * 3 + col]
  end
end
