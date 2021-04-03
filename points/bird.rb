require_relative "wrapping_point"

class Bird
  attr_reader :location

  def initialize(max_x, max_y)
    @location = WrappingPoint.new(0, 0, max_x, max_y)
  end

  def move_by(point)
    @location = location + point
  end
end
