class Game < Struct.new(:board)
  UNOCCUPIED = "-"
  ROWS = 3
  COLS = 3
  NO_MOVE = -1

  class Move < Struct.new(:game, :player, :i)
    def score
      play.winner == player ? 100 : 0
    end

    def <=>(other)
      score <=> other.score
    end

    private

    def play
      board = game.board.clone
      board[i] = player
      Game.new(board)
    end
  end

  def best_move_for(player)
    available_moves(player).max_by(&:score)&.i || NO_MOVE
  end

  def winner
    positions.each do |cells|
      return cells.first if cells.first != UNOCCUPIED && cells.uniq.one?
    end

    UNOCCUPIED
  end

  private

  def available_moves(player)
    board.size.times
      .select(&method(:can_move?))
      .map { |move| Move.new(self, player, move) }
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
