require_relative "wrapping_point"

class Button
  def initialize(name, max_x, max_y)
    @name = name
    @location = WrappingPoint.new(0, 0, max_x, max_y)
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
