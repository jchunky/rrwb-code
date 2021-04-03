class Point < Struct.new(:x, :y)
  def +(other)
    self.class.new(x + other.x, y + other.y)
  end

  def %(other)
    self.class.new(x % other.x, y % other.y)
  end
end
