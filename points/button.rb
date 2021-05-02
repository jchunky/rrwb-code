require_relative "wrapping_point"

class Button
  attr_reader :name, :location

  delegate :x, :y, to: :location

  def initialize(name, x_limit, y_limit)
    @name = name
    @location = WrappingPoint.build(0, 0, x_limit, y_limit)
  end

  def move_to(x, y)
    @location = location.move_to(x, y)
  end
end
