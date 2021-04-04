require_relative "wrapping_point"

class Bird
  attr_accessor :location

  def initialize(max_x, max_y)
    @location = WrappingPoint.for(0, 0, max_x, max_y)
  end

  def move_by(point)
    @location = @location.move_by(point)
  end
end
