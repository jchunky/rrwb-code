require_relative "wrapping_point"

class Button
  attr_reader :name

  def initialize(name, x_limit, y_limit)
    @name = name
    @location = WrappingPoint.new(0, 0, x_limit, y_limit)
  end

  def move_to(x, y)
    @location = @location.move_to(x, y)
  end

  def x
    @location.x
  end

  def y
    @location.y
  end
end
