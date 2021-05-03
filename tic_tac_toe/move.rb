class Move < Struct.new(:game, :player, :position, :score)
  def score
    game.winner == player ? 100 : 0
  end

  def <=>(other)
    score <=> other.score
  end
end
