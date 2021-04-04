class WrappingPoint
  attr_reader :x, :y, :max_x, :max_y

  def initialize(x, y, max_x, max_y)
    @x = x % max_x
    @y = y % max_y
    @max_x = max_x
    @max_y = max_y
  end

  def move_to(x, y)
    self.class.new(x, y, max_x, max_y)
  end

  def move_by(point)
    self.class.new(x + point.x, y + point.y, max_x, max_y)
  end
end
