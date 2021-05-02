require_relative "point"

class WrappingPoint
  attr_reader :location

  delegate :x, :y, to: :location

  def self.build(x, y, max_x, max_y)
    new(Point.new(x, y), Point.new(max_x, max_y))
  end

  def initialize(location, max)
    @location = location % max
    @max = max
  end

  def move_by(point)
    self.class.new(@location + point, @max)
  end

  def move_to(x, y)
    self.class.new(Point.new(x, y), @max)
  end
end
