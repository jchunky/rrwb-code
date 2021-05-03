require "test/unit"
require_relative "tic_tac_toe"

class GameTest < Test::Unit::TestCase
  def test_default_move
    game = Game.new(<<~BOARD.delete("\n"))
      XOX
      OX-
      OXO
    BOARD
    assert_equal(5, game.best_move_for("X"))

    game = Game.new(<<~BOARD.delete("\n"))
      XOX
      OXO
      OX-
    BOARD
    assert_equal(8, game.best_move_for("O"))

    game = Game.new(<<~BOARD.delete("\n"))
      ---
      ---
      ---
    BOARD
    assert_equal(0, game.best_move_for("X"))

    game = Game.new(<<~BOARD.delete("\n"))
      XXX
      XXX
      XXX
    BOARD
    assert_equal(-1, game.best_move_for("X"))
  end

  def test_find_winning_move
    game = Game.new(<<~BOARD.delete("\n"))
      OO-
      XX-
      OOX
    BOARD
    assert_equal(5, game.best_move_for("X"))
  end

  def test_win_conditions
    game = Game.new(<<~BOARD.delete("\n"))
      XXX
      ---
      ---
    BOARD
    assert_equal("X", game.winner)

    game = Game.new(<<~BOARD.delete("\n"))
      ---
      XXX
      ---
    BOARD
    assert_equal("X", game.winner)

    game = Game.new(<<~BOARD.delete("\n"))
      ---
      ---
      XXX
    BOARD
    assert_equal("X", game.winner)

    game = Game.new(<<~BOARD.delete("\n"))
      X--
      X--
      X--
    BOARD
    assert_equal("X", game.winner)

    game = Game.new(<<~BOARD.delete("\n"))
      -X-
      -X-
      -X-
    BOARD
    assert_equal("X", game.winner)

    game = Game.new(<<~BOARD.delete("\n"))
      --X
      --X
      --X
    BOARD
    assert_equal("X", game.winner)

    game = Game.new(<<~BOARD.delete("\n"))
      X--
      -X-
      --X
    BOARD
    assert_equal("X", game.winner)

    game = Game.new(<<~BOARD.delete("\n"))
      --X
      -X-
      X--
    BOARD
    assert_equal("X", game.winner)
  end
end
