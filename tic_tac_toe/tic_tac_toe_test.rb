require "test/unit"
require_relative "tic_tac_toe"

class GameTest < Test::Unit::TestCase
  def test_default_move
    game = Game.new(<<~BOARD.gsub("\n", ""))
      XOX
      OX-
      OXO
    BOARD
    assert_equal(5, game.move("X"))

    game = Game.new(<<~BOARD.gsub("\n", ""))
      XOX
      OXO
      OX-
    BOARD
    assert_equal(8, game.move("O"))

    game = Game.new(<<~BOARD.gsub("\n", ""))
      ---
      ---
      ---
    BOARD
    assert_equal(0, game.move("X"))

    game = Game.new(<<~BOARD.gsub("\n", ""))
      XXX
      XXX
      XXX
    BOARD
    assert_equal(-1, game.move("X"))
  end

  def test_find_winning_move
    game = Game.new(<<~BOARD.gsub("\n", ""))
      XO-
      XX-
      OOX
    BOARD
    assert_equal(5, game.move("X"))
  end

  def test_win_conditions
    game = Game.new(<<~BOARD.gsub("\n", ""))
      ---
      XXX
      ---
    BOARD
    assert_equal("X", game.winner)
  end
end
