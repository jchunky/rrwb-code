require_relative "point"

class WrappingPoint
  def self.for(point, max)
    new(point.x, point.y, max.x, max.y)
  end

  def initialize(x, y, max_x, max_y)
    @point = Point.new(x % max_x, y % max_y)
    @max = Point.new(max_x, max_y)
  end

  def +(other)
    WrappingPoint.for(@point + other, @max)
  end

  def %(other)
    WrappingPoint.for(@point % other, @max)
  end

  def move_to(x, y)
    point = Point.new(x, y)
    WrappingPoint.for(point, @max)
  end

  def x
    @point.x
  end

  def y
    @point.y
  end
end
