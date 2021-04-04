require "active_support/all"
require_relative "point"

class WrappingPoint
  attr_reader :point, :max

  delegate :x, :y, to: :point

  def initialize(x, y, max_x, max_y)
    @max = Point.new(max_x, max_y)
    @point = Point.new(x, y) % @max
  end

  def move_to(point)
    build(point)
  end

  def move_by(other)
    build(point + other)
  end

  def build(point)
    self.class.new(point.x, point.y, max.x, max.y)
  end
end
