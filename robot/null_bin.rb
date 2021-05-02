class NullBin
  def id
    nil
  end

  def to_s
    ""
  end

  def ==(other)
    id == other.id
  end
end
