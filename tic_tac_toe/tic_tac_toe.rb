require "active_support/all"
require_relative "board"
require_relative "move"

class Game
  NO_MOVE = -1

  attr_reader :board

  delegate :open_positions, :winner, to: :board

  def initialize(board_state)
    @board = Board.new(board_state)
  end

  def best_move_for(player)
    moves(player).max&.position || NO_MOVE
  end

  private

  def moves(player)
    open_positions.map do |position|
      candidate_game = play(position, player)
      Move.new(candidate_game, player, position)
    end
  end

  def play(position, player)
    Game.new(board.play(player, position).board)
  end
end
