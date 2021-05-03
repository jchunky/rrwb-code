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
    return board[0] if !occupied?(0) && board[0] == board[1] && board[1] == board[2]
    return board[3] if !occupied?(3) && board[3] == board[4] && board[4] == board[5]
    return board[6] if !occupied?(6) && board[6] == board[7] && board[7] == board[8]

    UNOCCUPIED
  end
end
