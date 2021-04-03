require_relative "point"

class Bird
  attr_accessor :location

  def initialize(max_x, max_y)
    @max = Point.new(max_x, max_y)
    @location = Point.new(0, 0)
  end

  def move_by(point)
    @location = (@location + point) % @max
  end
end
