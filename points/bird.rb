require_relative "point"

class Bird
  attr_reader :location, :max

  def initialize(max_x, max_y)
    @location = WrappingPoint.new(0, 0, max_x, max_y)
  end

  def move_by(point)
    @location = @location.move_by(point)
  end
end
