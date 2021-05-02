require_relative "point"

class Button
  attr_reader :name

  def initialize(name, x_limit, y_limit)
    @name = name
    @max = Point.new(x_limit, y_limit)
    @location = Point.new(0, 0)
  end

  def move_to(x, y)
    @location = Point.new(x, y) % @max
  end

  def x
    @location.x
  end

  def y
    @location.y
  end
end
