require_relative "point"
require_relative "wrapping_point"

class Bird
  attr_accessor :location

  def initialize(max_x, max_y)
    point = Point.new(0, 0)
    max = Point.new(max_x, max_y)
    @location = WrappingPoint.new(point, max)
  end

  def move_by(point)
    @location = @location.move_by(point)
  end
end
