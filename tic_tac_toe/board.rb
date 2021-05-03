class Board < Struct.new(:board)
  COLS = 3
  ROWS = 3

  def play(player, position)
    new_board = board.clone
    new_board[position] = player
    self.class.new(new_board)
  end

  def open_positions
    positions.select { |position| can_play?(position) }
  end

  def winner
    combinations.each do |cells|
      return cells.first if cells.first != "-" && cells.uniq.one?
    end

    "-"
  end

  private

  def positions
    board.size.times
  end

  def can_play?(position)
    board[position] == "-"
  end

  def combinations
    cols + rows + diagonals
  end

  def cols
    COLS.times.map(&method(:col))
  end

  def col(i)
    ROWS.times.map { |row| cell(row, i) }
  end

  def rows
    ROWS.times.map(&method(:row))
  end

  def row(i)
    COLS.times.map { |col| cell(i, col) }
  end

  def diagonals
    [diagonal1, diagonal2]
  end

  def diagonal1
    3.times.map { |i| cell(i, i) }
  end

  def diagonal2
    3.times.map { |i| cell(i, 2 - i) }
  end

  def cell(row, col)
    board[row * COLS + col]
  end
end
