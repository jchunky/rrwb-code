class Move < Struct.new(:game, :player, :position, :score)
  def score
    game.winner == player ? 100 : 0
  end

  def <=>(other)
    score <=> other.score
  end
end

class Game < Struct.new(:board)
  NO_MOVE = -1
  COLS = 3
  ROWS = 3

  def move(player)
    moves(player).max&.position || NO_MOVE
  end

  def moves(player)
    board.size.times
      .select { |position| can_play?(position) }
      .map do |position|
        candidate_game = play(position, player)
        Move.new(candidate_game, player, position)
      end
  end

  def play(position, player)
    candidate_board = board.clone
    candidate_board[position] = player
    Game.new(candidate_board)
  end

  def winner
    combinations.each do |cells|
      return cells.first if cells.first != "-" && cells.uniq.one?
    end

    "-"
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
