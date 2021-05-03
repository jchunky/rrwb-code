class Game < Struct.new(:board)
  UNOCCUPIED = "-"
  ROWS = 3
  COLS = 3

  class Move < Struct.new(:game, :player, :i)
    def score
      play.winner == player ? 100 : 0
    end

    private

    def play
      board = game.board.clone
      board[i] = player
      Game.new(board)
    end
  end
  NO_MOVE = Move.new(nil, nil, -1)
  def NO_MOVE.score
    -1
  end

  def best_move_for(player)
    best_move = NO_MOVE
    each_move(player) do |move|
      best_move = move if move.score > best_move.score
    end
    best_move.i
  end

  def winner
    positions.each do |cells|
      return cells.first if cells.first != UNOCCUPIED && cells.uniq.one?
    end

    UNOCCUPIED
  end

  private

  def each_move(player)
    board.size.times.each do |move|
      next unless can_move?(move)

      yield Move.new(self, player, move)
    end
  end

  def can_move?(move)
    board[move] == UNOCCUPIED
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
