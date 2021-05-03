require_relative "point"
require "active_support/all"

class WrappingPoint
  attr_reader :point, :max

  delegate :x, :y, to: :point

  def self.build(x, y, max_x, max_y)
    new(Point.new(x, y), Point.new(max_x, max_y))
  end

  def initialize(point, max)
    @point = point % max
    @max = max
  end

  def +(other)
    self.class.new(point + other, max)
  end

  def move_to(x, y)
    self.class.new(Point.new(x, y), max)
  end
end
