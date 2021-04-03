require_relative "point"

class Bird
  attr_accessor :location

  def initialize(max_x, max_y)
    @max = Point.new(max_x, max_y)
    @location = Point.new(0, 0)
  end

  def move_by(point)
    x = (@location.x + point.x) % @max.x
    y = (@location.y + point.y) % @max.y
    @location = Point.new(x, y)
  end
end
