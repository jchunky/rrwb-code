require "active_support/all"
require_relative "point"

class WrappingPoint
  attr_reader :point, :max

  delegate :x, :y, to: :point

  def self.for(x, y, max_x, max_y)
    point = Point.new(x, y)
    max = Point.new(max_x, max_y)
    new(point, max)
  end

  def initialize(point, max)
    @point = point % max
    @max = max
  end

  def move_to(point)
    build(point)
  end

  def move_by(other)
    build(point + other)
  end

  private

  def build(point)
    self.class.new(point, max)
  end
end
