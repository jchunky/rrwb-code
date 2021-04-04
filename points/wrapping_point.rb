require "active_support/all"

class WrappingPoint
  attr_reader :point, :max

  delegate :x, :y, to: :point

  def initialize(x, y, max_x, max_y)
    @max = Point.new(max_x, max_y)
    @point = Point.new(x, y) % @max
  end

  def move_to(x, y)
    self.class.new(x, y, max.x, max.y)
  end

  def move_by(other)
    self.class.new(x + other.x, y + other.y, max.x, max.y)
  end
end
